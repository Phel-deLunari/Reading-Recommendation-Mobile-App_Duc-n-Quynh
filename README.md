# Reading-Recommendation-Mobile-App_Duc-n-Quynh
Ứng dụng tập trung vào các tính năng cốt lõi:

Khám phá: Duyệt sách mới, sách nổi bật trên Trang chủ và tìm kiếm/lọc sách theo thể loại trong Danh mục.

Chi tiết sách: Xem tóm tắt và thông tin đầy đủ của mỗi đầu sách.

Thư viện của tôi: Quản lý danh sách sách đang đọc, đã đọc, hoặc sách muốn đọc (Wishlist).

Cá nhân hóa: Cho phép người dùng tùy chỉnh Cài đặt (Ngôn ngữ, Chế độ Sáng/Tối) và Thông tin người dùng.

Lưu ý quan trọng: Trong phiên bản hiện tại, toàn bộ dữ liệu (danh sách sách và thư viện cá nhân) được lưu trữ trong bộ nhớ tạm (in-memory state), phục vụ mục đích demo và xây dựng cấu trúc ứng dụng.

Công nghệ sử dụng:
Framework Chính: Flutter (phiên bản mới nhất) được sử dụng để phát triển ứng dụng di động đa nền tảng, cho phép triển khai đồng thời trên Android và iOS từ một mã nguồn duy nhất.

Ngôn ngữ Lập trình: Dart.

Quản lý Trạng thái: Thư viện Riverpod được áp dụng để quản lý In-Memory State (trạng thái trong bộ nhớ).

Nó quản lý toàn bộ dữ liệu mẫu (Mock Data) về sách và các thay đổi trong Thư viện của tôi (My Library).

Thiết kế Giao diện: Sử dụng Material Design để xây dựng giao diện người dùng hiện đại, nhất quán.

Nguồn Dữ liệu: Hoàn toàn là Dữ liệu Mẫu (Mock Data) tĩnh, được định nghĩa trong các Model Class.

Gói Hỗ trợ (Packages):

Sử dụng các lớp Model (Book, UserLibrary) để định nghĩa cấu trúc dữ liệu.

Sử dụng gói hỗ trợ Đa ngôn ngữ (i18n) để xử lý việc chuyển đổi ngôn ngữ Anh/Việt.
