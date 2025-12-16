Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A5314B8E
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878046; cv=none; b=GsdfaNn0ZpATo74KhzdLftxEsjAwTtMQEyYbWn3HvDbXTcbQRXNUbSD4S1y0wm2E3PBNpNYBPZRa1OzN/tK+Rvq8NcURzKYYklQy5paXiN7XkmcfwYidU/kRhN327NOC+qYwTWHwT1I1snCU9nPfQiEZjIRaFFw6/2y0stD7ogk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878046; c=relaxed/simple;
	bh=/KuCE1oVoKwhFRZxrnWzL267YxvDezKhlS9MzFOQJ8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kSoha3SB863gWeyeNKYq9hCnK6bGlnWSksRD9NJdJ21jwBEpg4X2pyTkOYSXRi0jxwNuXh1fxa+w7J/p4sHlCM4H2YcjV0FxrWu85nVcGNGLlUMuGq1ks+4n06INDEJv+e2wHX9nOPPoIItkbQgm8IKhnk3+Glt1nljzdYdn/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTCT3Rc1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTCT3Rc1"
Received: by smtp.kernel.org (Postfix)
	id 0ACACC16AAE; Tue, 16 Dec 2025 09:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532E8C4CEF1;
	Tue, 16 Dec 2025 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765878045;
	bh=/KuCE1oVoKwhFRZxrnWzL267YxvDezKhlS9MzFOQJ8k=;
	h=From:Date:Subject:To:Cc:From;
	b=RTCT3Rc1UbrnLZroUJ0Ssy3CGBOf2gy3PIP4M6FK5HMIVFhxLgvMfSNdha7MUPKoZ
	 ypBm7hzsjnjV5+Phvot8ZT6NjaCKy2EX445w7mX8/X3gzk5EDSHVXeJOPg0Zknr5Ue
	 X1nJoq+ipjUqm93UvzemWAYZQLG1Nt9Utd0tOekzdDbo1kGy3nbZJzhpoKOg5YvXzn
	 +gFoMncOkIq6FE19kHK92wlaoYsuGfXIusYv6kre53tcBLWRkoPX5V7hGgMn+YkWh4
	 oRH8r3HHfGBCi8EgsC5k3UY3IhOo/lh/PU6kUVDzDoFCPQ3LurN3lcbIhJp/RgtFlZ
	 VY33f96UA27Ow==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 16 Dec 2025 10:40:42 +0100
Subject: [PATCH] MAINTAINERS: Fix a linusw mail address
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-maintainers-fix-v1-1-92f11231b27e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBBFryKzTsgBC7pKtDAdaxZZaEQg3r2hx
 Vu8B/9XKJSZCkyqQqaHC59JxHQK/O7SRpqDOGCP1qAZ9OE43QLloiO/2jofzIqINEaQ1ZVJ8v8
 4L619fhwA+WEAAAA=
X-Change-ID: 20251216-maintainers-fix-5acd1b222e7f
To: soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The patch adding me to the SoC maintainers was in-flight at the
time I had to change my mail address. This fixes it up.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
SoC maintainers: please apply this for fixes to Torvalds.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..15c4dacfa5f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2011,7 +2011,7 @@ ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
 M:	Arnd Bergmann <arnd@arndb.de>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 R:	Drew Fustini <fustini@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	soc@lists.linux.dev

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251216-maintainers-fix-5acd1b222e7f

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

