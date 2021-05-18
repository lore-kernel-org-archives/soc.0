Return-Path: <SRS0=oZuc=KN=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350F0C433ED
	for <soc@archiver.kernel.org>; Tue, 18 May 2021 10:07:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0FE61611BD; Tue, 18 May 2021 10:07:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8748610CB
	for <soc@kernel.org>; Tue, 18 May 2021 10:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8748610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lj1-f172.google.com with SMTP id w4so10835124ljw.9
        for <soc@kernel.org>; Tue, 18 May 2021 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zuwdeAPUpN79x5GuaLRBL3CmBAv3cElVGO0nQDT8pgg=;
        b=dOddR+RZh8FPgN0Hy3+Tbb5TGSLunQQ9yYAD4rNn19MBDdv5GyWH8FzcAriBMxmcjL
         XlJkuPyqR7eEpzZjK4Ujn7CvOL86843Zjcky20VYxqotRYfICScleBQpqgQlLLepGwqD
         pqAe29fwO7AKOGE/3UG7pGRJq7j8zUDwVbBAdkkneqcrltmLA3TrEqVaCkD4wFUWcZ9f
         VV7Z1ejE6rfELszkkTiGVsUfp+vdPJfb4mWuF+rRg4cDC256RncTvbzHiWs3iA7YOT8b
         iagqYVgxitcc1BTKOfDD7FjWonv28yhznXveoTDu7MCOZlkuclFHt2lBlAe+pZ2yLXo2
         UagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zuwdeAPUpN79x5GuaLRBL3CmBAv3cElVGO0nQDT8pgg=;
        b=ikLGpKimd5FO8oZU0OduMSk8FkEcujwzAk//d2ZZWOe0twBYiE9L7TCMyfpiOnxTjT
         8xSTE0LqvY64ZxGV60/0isdbw1J+SyweIOaHKiV5vHLJo7ZQDSvkkVQ/InGP2kLjgCIc
         O4Aa+erKseaMwuZYwqU3X225zwd+Q73sqWs9FLOBmo2WY2zJIy/w/BCLvSQ3bqUECoTl
         8aN8+63NjBlGCCS9IKAILV8Ql9GJLt/gyY9Ri2cCn1sFLwqOuKp/7CMX8GRShAFyadK0
         2UPggWT7rD0njEW0bx5Xxrof4wXV2go2RwjpZS19Kg0o9843oozhicNMVUiHBMcyCzcJ
         m8kg==
X-Gm-Message-State: AOAM533WEHjk7MVXk6LiJK+Muhn0coLzdl9rQJQgTMG9fJ2DlsgIzaWR
	MhWiBYQoJRZBNN0sjDHVjpeAcg==
X-Google-Smtp-Source: ABdhPJwgYeWUM1gLeYEBPloQMQfy3RcflzWXk1IBzIfC7kzQfQ2g6NQCJJURbpi1AuwyPdq8lZFmXQ==
X-Received: by 2002:a2e:a547:: with SMTP id e7mr3507237ljn.408.1621332434186;
        Tue, 18 May 2021 03:07:14 -0700 (PDT)
Received: from jade (h-79-136-85-3.A175.priv.bahnhof.se. [79.136.85.3])
        by smtp.gmail.com with ESMTPSA id u23sm1586531lfq.287.2021.05.18.03.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 03:07:13 -0700 (PDT)
Date: Tue, 18 May 2021 12:07:12 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] OP-TEE fix for v5.13
Message-ID: <20210518100712.GA449561@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small OP-TEE driver fix which uses export_uuid() to copy
the client UUID instead of making asumptions about the internal format of
uuid_t.

Thanks,
Jens

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.13

for you to fetch changes up to 673c7aa2436bfc857b92417f3e590a297c586dde:

  optee: use export_uuid() to copy client UUID (2021-05-18 07:59:27 +0200)

----------------------------------------------------------------
OP-TEE use export_uuid() to copy UUID

----------------------------------------------------------------
Jens Wiklander (1):
      optee: use export_uuid() to copy client UUID

 drivers/tee/optee/call.c      | 6 ++++--
 drivers/tee/optee/optee_msg.h | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)
