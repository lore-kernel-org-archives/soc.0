Return-Path: <SRS0=u3eJ=V7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95721C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 08:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A419C34115; Mon, 23 May 2022 08:57:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9863BC385A9
	for <soc@kernel.org>; Mon, 23 May 2022 08:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9863BC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id u30so24363558lfm.9
        for <soc@kernel.org>; Mon, 23 May 2022 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qR7H0qStNTe9iR8CcNIgL5rmiYjyIooKLwWYrLY5b4U=;
        b=QJ3/n7DodBQvdPT3B0a8FnEg4z99FgHl5Jmn0BQYYsljDRTb/k0dEocQv8aoY7IMde
         Srub6GJw9ggt/ZzlTLHeGo449PlYv/Yx65d5whATZRntj/NwzSFnJ0WbQVVq3ai3Di1X
         j8JzTqbWy1JAR1RKplNAvczUkVAwftWNku3yTli8JgYM+4xqi92GVo65vR3GKbT+5WhT
         oae4xb4/ajDumOhUL/eC3VfzX6gcEKRFGqxCgQ8jhufyDB40xpe7pbfGdeCFRqPQFd9C
         mVs0VctQJ/PtxYUpARotd/MFUYsPWywRkYyuodPnKLZtMaSKIemYo4MOS4OF8ZgoAZFf
         whcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qR7H0qStNTe9iR8CcNIgL5rmiYjyIooKLwWYrLY5b4U=;
        b=W/tv02c2jBHHxLSr/3fMaWt95maHX8WyrqfAjDedmYJ6dBxXfNN7xoTyvHpUmWaPFf
         b/yB9WI198jFEoNAq3BknvObFQMuyXgCZsDLqc+fh8bTSgeFSJ7m+d0AupNMwH+/s+jQ
         tT1OzgI8sVw7O0nHzsiYHBlxBdB8T1UninTq015hUqboGgpsBD552L1frhxBpgXGurli
         S0saKJ0dSUgioJGmDq699E1eVe9pRVgawpFZVse5j4rXulZINOpAJ361NRIxbXcmdK3+
         6lRzu1w6vSiV44ntqlcvjZBj2KItreyKBZ3R9wA1qhOAqtXuwrKXEGsF9eIRYQl2nvo/
         MMgw==
X-Gm-Message-State: AOAM530DO4qyzCogFzbYOfYHIoKnAfFNnm+bqUuGb5THE6CRE2I5mhpw
	sR6FuNXEz2sTi99kKCYOiLGR+g==
X-Google-Smtp-Source: ABdhPJznbj0FPruHl0aQqScW8A/097h+RBl6grsZEERwhbBEJnuQoMvy2Gb2ffBQmga0oMrYwlCajw==
X-Received: by 2002:a05:6512:2290:b0:478:5fe1:c754 with SMTP id f16-20020a056512229000b004785fe1c754mr6906333lfu.323.1653296244651;
        Mon, 23 May 2022 01:57:24 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v22-20020ac25596000000b0047255d210e7sm1864809lfg.22.2022.05.23.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 01:57:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] soc: ixp4xx/qmgr: Fix unused match warning
Date: Mon, 23 May 2022 10:55:20 +0200
Message-Id: <20220523085520.913217-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel test robot found this inconsistency:

>> drivers/soc/ixp4xx/ixp4xx-npe.c:737:34: warning:
  'ixp4xx_npe_of_match' defined but not used [-Wunused-const-variable=]
     737 | static const struct of_device_id ixp4xx_npe_of_match[] = {

This is because the match is enclosed in the of_match_ptr()
which compiles into NULL when OF is disabled and this
is unnecessary.

Fix it by dropping of_match_ptr() around the match.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly for fixes for v5.19.
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 9154c7029b05..291086bb9313 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -459,7 +459,7 @@ static const struct of_device_id ixp4xx_qmgr_of_match[] = {
 static struct platform_driver ixp4xx_qmgr_driver = {
 	.driver = {
 		.name           = "ixp4xx-qmgr",
-		.of_match_table = of_match_ptr(ixp4xx_qmgr_of_match),
+		.of_match_table = ixp4xx_qmgr_of_match,
 	},
 	.probe = ixp4xx_qmgr_probe,
 	.remove = ixp4xx_qmgr_remove,
-- 
2.35.1

