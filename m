Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2552BC433F5
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 14:53:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CD25060EE2; Mon, 27 Sep 2021 14:53:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C4DD60FD7;
	Mon, 27 Sep 2021 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632754419;
	bh=cF5T2TlDxPW2aCrkwNwJXmbL3iVCdgO2agfHOyQPUZA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mp8h9LP4IaWp953vvnItgiSCgSCnXosokidNr6Kwc2RR9srlN2N6+Sui178UgXUal
	 0LQWeFmFzcoHh19nLI9cF+PSeBQxTV+KFnqXvSnGOCCh1qupU6Mz1ckvUGFZbnv3Ky
	 04LSStFHkPlgUAgwrcso4JVNryqwAfnuB/G85pYn9oxedcjciOWE+iKaXVOs3lnYM3
	 edKBGpnLvLMtorqAQi+MPiYzCP9voQ58uxgBhT+FncYFuxb0kXyWe048i3Iy0rapDa
	 VSGIWaRXdDGLAZvgnA9j4Xv1Jok6acXL4T2sTBbFwAAJg3Zd+eLnm5JCg2FffBQmY1
	 1eBZqy0WB6JfQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] ARM: sharpsl_param: work around -Wstringop-overread warning
Date: Mon, 27 Sep 2021 16:53:25 +0200
Message-Id: <20210927145332.2784005-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc warns that accessing a pointer based on a numeric constant may
be an offset into a NULL pointer, and would therefore has zero
accessible bytes:

arch/arm/common/sharpsl_param.c: In function ‘sharpsl_save_param’:
arch/arm/common/sharpsl_param.c:43:9: error: ‘memcpy’ reading 64 bytes from a region of size 0 [-Werror=stringop-overread]
   43 |         memcpy(&sharpsl_param, param_start(PARAM_BASE), sizeof(struct sharpsl_param_info));
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this particular case, the warning is bogus since this is the actual
pointer, not an offset on a NULL pointer. Add a local variable to shut
up the warning and hope it doesn't come back.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
If there are no objections, I'd apply this one through the soc tree.
---
 arch/arm/common/sharpsl_param.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
index efeb5724d9e9..6237ede2f0c7 100644
--- a/arch/arm/common/sharpsl_param.c
+++ b/arch/arm/common/sharpsl_param.c
@@ -40,7 +40,9 @@ EXPORT_SYMBOL(sharpsl_param);
 
 void sharpsl_save_param(void)
 {
-	memcpy(&sharpsl_param, param_start(PARAM_BASE), sizeof(struct sharpsl_param_info));
+	struct sharpsl_param_info *params = param_start(PARAM_BASE);
+
+	memcpy(&sharpsl_param, params, sizeof(*params));
 
 	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
 		sharpsl_param.comadj=-1;
-- 
2.29.2

