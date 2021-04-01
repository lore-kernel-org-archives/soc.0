Return-Path: <SRS0=6LjJ=I6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921FCC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 17:26:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 610BE613B5; Thu,  1 Apr 2021 17:26:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD24613B9;
	Thu,  1 Apr 2021 17:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD24613B9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-ej1-f46.google.com with SMTP id w3so4018860ejc.4;
        Thu, 01 Apr 2021 10:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Omm+oEQ1soNxmNoKODfBvftl8Wbkbkn+2eacAPkZvY=;
        b=tsob7xXrkZ7jnS1kyYuhptSfIT3jomtbs2ZL11Wx/MdFuYfvO+yhUBC3PtK5wKv/G1
         bUHi7XHiZGnuymA9UO6GywV42BrngqwFiLl4mCvIJfYZOiPHZBYYqsPJoYX16rtougkB
         Mm7zOyWeN7hnRnseW5t0Ez69gyIlMlLGKNHNppjYlfUAyNz5otEm49so0E1HnKmUUJA7
         ONEzdvUFel2XYMRMsx0PzwEjiG1pVtZExoJNiM0Cu1uirSFQC2OJ735+nTybckScTrf5
         Pd1sGJwnhKTaUSo1+I3MWEkJCQ1j+pqbxCXGY8MFk+lGUNVyTJVNnJsBwgior98O2OMy
         mXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Omm+oEQ1soNxmNoKODfBvftl8Wbkbkn+2eacAPkZvY=;
        b=dQt4kdfV+Ip93RKaZddN0u0niCM0nH+JhFRt0eZWHRGQO9Pc/j2hFKb3qSB55fwHOZ
         cOomOdlZwclrNZ3/zomwLfmC14MPb4/XXyqhFiWLfrSWBVkn6EdDWtcFS933AazMH4H2
         CyvnjxMtnPa5Bk9edntF3yGfeLVo6fn2VTrAgE8WTXW2B7dVPX/mXbK0TpiZjR81lWdg
         NFTXq+euaXWXQ9eIKNZkxXm5uWdoutzPq4srUXGp7xtS0rUy+rU8an+NSskS4mfaXCKl
         G9uFTh4loS78rnJLm/H+a+5GGCFnIIfPc4jQUcxNpc7UlazxI2gETLniLMYue8jXdwlD
         KUAw==
X-Gm-Message-State: AOAM533+FtyAb882l2TDR4pUyBfBUrfdo6EUqxV9BmSWCUp/mz12OpC1
	6Xj6iMbsNHFtmzJylh7tBsoELg8PJfg=
X-Google-Smtp-Source: ABdhPJzqPLheYK+WbmzO01k9KyCjZMQ0LGPYHUZmVfXeAf+8NxLcNxqFDd5AXEIvO+FGNC7oqsS9+g==
X-Received: by 2002:a17:906:3f87:: with SMTP id b7mr10253092ejj.139.1617297962946;
        Thu, 01 Apr 2021 10:26:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c12sm4199808edx.54.2021.04.01.10.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:26:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] soc/tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:20 +0200
Message-Id: <20210401172622.3352990-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-soc

for you to fetch changes up to 366d7c643a8a9db652341e314b33d3fc80595e6c:

  soc/tegra: pmc: Print out domain name when reset fails to acquire (2021-03-26 13:10:25 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.13-rc1

Contains a couple of fixes to the PMC power domain implementation and
exports a regmap from PMC needed to implement USB sleepwalk support.

----------------------------------------------------------------
Dmitry Osipenko (5):
      soc/tegra: regulators: Fix locking up when voltage-spread is out of range
      soc/tegra: pmc: Fix imbalanced clock disabling in error code path
      soc/tegra: pmc: Fix completion of power-gate toggling
      soc/tegra: pmc: Ensure that clock rates aren't too high
      soc/tegra: pmc: Print out domain name when reset fails to acquire

JC Kuo (1):
      soc/tegra: pmc: Provide USB sleepwalk register map

 drivers/soc/tegra/pmc.c                | 259 ++++++++++++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c |   2 +-
 2 files changed, 252 insertions(+), 9 deletions(-)
