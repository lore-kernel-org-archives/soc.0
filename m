Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3013BC18
	for <soc@lists.linux.dev>; Wed, 23 Oct 2024 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729657113; cv=none; b=fRfK1fa5/rRok2jk2JlxkCouGDBt7to0Yx1dIq46ijHI9sM+gpe+dZ3W+4PE50W7c8CMxHShq6amX/1afkHUfoYZIIYnElR6xMz/sZUIJ/nIBNgVHlVjniNJDwAfyv+L1rhGMM1kI8Yf1AWOqkXVgBMpFj/yFH9wDzWinK+Nw1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729657113; c=relaxed/simple;
	bh=MXqKhhMBhWyZBsc9SHS9qzVzU0b6p3uwUTvpSqcje4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kmbEwm/xL9ujAHx03WcjFrNP6/0wxUuWQKA6ORJpWZajeWobRjfrEtg44lcxW/u8SjiknVv025Va3qeDMTrix/XHB6wgC6IG5RAwQQLC2SGZkGMOeLz0NW2z3JiWh81txGEY94jUUXQxsbcsmeczknhdTz/WbJfqM7YosmcLTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4D9A7C4CEF3; Wed, 23 Oct 2024 04:18:33 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A29BC4CEE4;
	Wed, 23 Oct 2024 04:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A29BC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 23 Oct 2024 12:18:19 +0800
Subject: [PATCH] MAINTAINERS: setup support for SpacemiT SoC tree
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAAp5GGcC/x2MywqAIBAAf0X23IIvPPQr0cFqrSWy0IhA/Pekw
 xzmMFMgU2LK0IsCiR7OfMYmqhMwbz6uhLw0By21VVIblBJ3hYfneDcooXU0mWAUuaChZVeiwO+
 /HMZaP/FPGGtiAAAA
X-Change-ID: 20241023-00-k1-maintainer-46eb3f31e6f2
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, soc@kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=MXqKhhMBhWyZBsc9SHS9qzVzU0b6p3uwUTvpSqcje4o=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnGHkQ6gEuQT2/wDz1XN47OF8HfofAhGoUpBECM
 ZShQunUMIKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZxh5EF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277cUWD/4pDWbldKSBD+E66k
 Mo6M208LrmXKaDlZ0KQ77I8hBDOGQWXoyHRNrd3CUGIRs4eVP4BdPYO6ny1eTAsobOjkx1UA9w1
 M9gjZn8Jvh1Stq/C5qD9QzUKo9dhdR47kDUodh2wIdretYBgPyXycXws0IMrfQ0QQ3CiPrcQVoe
 2XRqRY0Ud//eJavXsI0zg+kNiOy8wpwFcbMIVHJsVHaSjM8fMQJ/eyN3UhZAqqPvnp7FoEVolY2
 54E6RCTDCPe6p0Kxv1j4VgCaSAdrHO+oWr5y/Tx1f9T9N9YN/LGDNRIZFyntzCvxW66OJAMi6pn
 rj2F0YKIl88WOHhQivC4NhbwsOWwZ6TWHwSzCPRAz6iT8Inrx3v1zNSYV8Qw36CezQ0aO5Hs4W1
 xJRfGXw9JCGWu9V5W4aX1JRrti3yJnuH1zCFYIlCAE626+92/4okuRsD+pP55rSg6I5fsyED2s2
 xtu8vwfGpzO75XtQQuSbveEyNOAauTIH3+p8IlGYYOSHar5eVeRqwnZq5EN6+YM4kbvCRW7ncj6
 IcqhYg9WP+ayVvLVoqw3NoEUYhkKsyhkybHz5n6qVEYPw9hnyc2dOv9SpWFHru72OFKkO+WYVwU
 kgi/6hf9whex/i1/lIVEy+B3d3dux9lGCjDsK+//GJ+1J7npK9ltIRtFyS0Kn85+ofxg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add myself as maintainer of SpacemiT's SoC tree, which
suggested by Conor [1].

Link: https://lore.kernel.org/all/20241018234615-GYA2124001@gentoo/ [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This will setup proper maintainer info about Spacemit's kernel tree,
which should help to take soc and device tree patches, and send the
pull request up to Arnd's soc tree.

I asked Kevin to host the kernel tree under SpacemiT's account
on github, which should help people to get access more easily,
and promote the tree a little bit.

I could take this patch through this spacemit's soc tree if no objection,
of cource, after got ACK.
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3347d649855992a559e3526d18443..4087023593f7a0b2d5c5827df682230c329f82a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19791,6 +19791,7 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 X:	arch/riscv/boot/dts/sophgo/
+X:	arch/riscv/boot/dts/spacemit/
 X:	arch/riscv/boot/dts/thead/
 
 RISC-V PMU DRIVERS
@@ -21578,6 +21579,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT SoC Support
+M:	Yixun Lan <dlan@gentoo.org>
+S:	Maintained
+T:	git https://github.com/spacemit-com/linux
+F:	arch/riscv/boot/dts/spacemit/
+N:	spacemit
+K:	spacemit
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
 R:	Avadhut Naik <avadhut.naik@amd.com>

---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241023-00-k1-maintainer-46eb3f31e6f2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>

