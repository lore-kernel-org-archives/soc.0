Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D9AC636D4
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 19:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A57BC433D2; Fri, 10 Feb 2023 19:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78062C433A7;
	Fri, 10 Feb 2023 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676058851;
	bh=SjJDx1P6SyhsBO9OLesuuShAMN3+Y5zTtnZbVskcLI8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=G/W9M6ZhvfsQ36u1QVT6MOkeLaXsdvrM0Lm34U6px4VJ0IIE+c/KZYQgqLdOk58yx
	 DD5+4w515wQKy5oSUggRDq8kXujvU81AbwTjmg+NfnIYX3ahZZmTahnFzvnROPitTI
	 mU//02k8JlLAXc59g1E39Mn5IDyGbLJOHt6y2y9HAX7c2AjuhNusFnCRZY27aQZW5r
	 B97lpdFNasPSVoRSgU6boQ9L7H5Oui8Yu7YF1NUymPBJIkV+juGOBzOrG6R8NOskG9
	 fcK3CHhwepUsFHPRCeQkwGI6rK5oekO/7nQ321Vq7GdyUpFXN6fVCSDuxAU/zKAWkr
	 3sWBZzIBYz74w==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 10 Feb 2023 19:52:47 +0000
Subject: [PATCH 1/3] scripts: merge_config: Add option to suppress warning
 on overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-arm64-defconfigs-v1-1-cd0694a05f13@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2813; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SjJDx1P6SyhsBO9OLesuuShAMN3+Y5zTtnZbVskcLI8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj5qDa6UsXmiY6F6KpytcyYNRwEmRSxKg/FVz+rZRK
 3ctju9CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY+ag2gAKCRAk1otyXVSH0HD1B/
 4umTKscagIZ1bx3dT3nhZp+wDNOyjeLdftgFGPvNrx5q4NO7gmsAJ5QicomelxeRGBm+MVSy1VgRQT
 J9qepSgjKAGNvMqrqtl4RiQHxIQEn/SorbRdBD5huORMBfr5dGIrZtkrxme1G+mYhV9K3iqLqcosow
 poFJgrYGMXAu8EdaQa99rsiJX1f+3GiDdm4qUp3YVnPxT/C8gc9q4T71OPHxvvtsvytxuJbw2TaqE8
 xMJfYqxoUaeq/gIqFD2hIqW9N7Kq5osqRof2tqgwLHi0Zap4Eu5dmhLKkfvdhX426tkwv9SLZ5mZn7
 s4ANX70KaNZKgVK2jctF4ktT/73CAd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently merge_config.sh will unconditionally warn if a fragment overrides
any already set symbol. This is generally desirable but is inconvenient in
cases where we want to create a fragment which disables unwanted options in
the base configuration, for example when attempting to produce a smaller
version of another configuration.

Add an option -Q which will suppress these warnings.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/kconfig/merge_config.sh | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index e5b46980c22a..32620de473ad 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -29,6 +29,7 @@ usage() {
 	echo "  -y    make builtin have precedence over modules"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo "  -s    strict mode. Fail if the fragment redefines any value."
+	echo "  -Q    disable warning messages for overridden options."
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
 }
@@ -40,6 +41,7 @@ BUILTIN=false
 OUTPUT=.
 STRICT=false
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
+WARNOVERRIDE=echo
 
 while true; do
 	case $1 in
@@ -82,6 +84,11 @@ while true; do
 		shift
 		continue
 		;;
+	"-Q")
+		WARNOVERRIDE=true
+		shift
+		continue
+		;;
 	*)
 		break
 		;;
@@ -138,21 +145,21 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
 		BUILTIN_FLAG=false
 		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
-			echo Previous  value: $PREV_VAL
-			echo New value:       $NEW_VAL
-			echo -y passed, will not demote y to m
-			echo
+			${WARNOVVERIDE} Previous  value: $PREV_VAL
+			${WARNOVERRIDE} New value:       $NEW_VAL
+			${WARNOVERRIDE} -y passed, will not demote y to m
+			${WARNOVERRIDE}
 			BUILTIN_FLAG=true
 		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
-			echo Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
-			echo Previous  value: $PREV_VAL
-			echo New value:       $NEW_VAL
-			echo
+			${WARNOVERRIDE} Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
+			${WARNOVERRIDE} Previous  value: $PREV_VAL
+			${WARNOVERRIDE} New value:       $NEW_VAL
+			${WARNOVERRIDE}
 			if [ "$STRICT" = "true" ]; then
 				STRICT_MODE_VIOLATED=true
 			fi
 		elif [ "$WARNREDUN" = "true" ]; then
-			echo Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
+			${WARNOVERRIDE} Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
 		fi
 		if [ "$BUILTIN_FLAG" = "false" ]; then
 			sed -i "/$CFG[ =]/d" $TMP_FILE

-- 
2.30.2

