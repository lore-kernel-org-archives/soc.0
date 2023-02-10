Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97198C636D4
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 19:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B0D6C4339B; Fri, 10 Feb 2023 19:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E9FC4339C;
	Fri, 10 Feb 2023 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676058855;
	bh=sUouHfKzB8QNcmsZOIwlgTdDLylu0lcK0/xdfuXCJOg=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=L25HNEQyRMRx1tQc8Yx+YMZUylYz94mPOw+s4XTU2SvaHqgZ5Z6vm3Hvws0rZMPj0
	 yNzxUSF72dxlAtxHNEvtcf40oOWnGAys56Yxvmzoopa+qScmRoqLLkB/3+iYFWNxLt
	 6kKCCcz6flwcCqwVSrfw7LJXXFJxIaE2bsjKcKkagNdZqQnd23M7AbegWZm6g6pY4z
	 n/abe6AayCvNmRIZEtvH0HvVA2QZR+lhlMu+SDVa2MHPc0S/21soo05z2DHiNAjbq0
	 xYU2iEcz+lHr8Isn87Ptq7l2/VpojFjC5PUuSPw3VjZK5oZf8MKnowuifIBOC+NufL
	 1x9FeK3NgIgNQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 10 Feb 2023 19:52:48 +0000
Subject: [PATCH 2/3] kbuild: Provide a version of merge_into_defconfig
 without override warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-arm64-defconfigs-v1-2-cd0694a05f13@kernel.org>
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
In-Reply-To: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sUouHfKzB8QNcmsZOIwlgTdDLylu0lcK0/xdfuXCJOg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj5qDb+8sxNLUs/YY2zxViJb60ghK64OQUFJrkF2Ze
 xDFx8mmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY+ag2wAKCRAk1otyXVSH0B8WB/
 9b6xpUsznvytgwXy7hLg2BSznsdSevRxL455FnbMf75gQh4FhSd7q261HEwNpaq//il9B6TS7V/2/B
 8ZhWwoLkCm7AbY9jYlzCFohYVDbV9P4UH/Zv7+uzUUuJd9b69TsxnbTg0nD/Av9EGTHV+inhRaLtId
 aZ2v93h0+hSbTlVOspn6GEskyBqB5CwFfRsCQPo0nN/kxScZvrHn/Vg5oUKNSzE1AWS3rh5CLkBaYD
 93qDhiKcY3m1VrUg52+5R2J4yxEkm3YbkQfK5nQmZU1e8yjTqNl1qXPj4CrPX36FY0jbMARJQx+9GB
 G0NwNZlrZfTs7Pm1NDnYCtN6qe4LM1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

While warning on overridden Kconfig options is a good default for merging
config fragements sometimes that is our explicit intent and the warnings
are unhelpful, add a new merge_into_defconfig_override which does the merge
but with warnings suppressed.

Since merge_into_defconfig accepts any number of fragments it is difficult
to allow it to accept the flag.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/Makefile.defconf | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index ab332f7534f5..ab271b2051a2 100644
--- a/scripts/Makefile.defconf
+++ b/scripts/Makefile.defconf
@@ -13,3 +13,17 @@ define merge_into_defconfig
 		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
+
+
+# Creates 'merged defconfigs without warning about overrides'
+# ---------------------------------------------------------------------------
+# Usage:
+#   $(call merge_into_defconfig_override,base_config,config_fragment1 config_fragment2 ...)
+#
+# Input config fragments without '.config' suffix
+define merge_into_defconfig_override
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
+		-Q -m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
+		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
+	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+endef

-- 
2.30.2

