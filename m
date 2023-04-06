Return-Path: <SRS0=gyVr=75=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20AC7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1042AC4339E; Thu,  6 Apr 2023 12:48:08 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2DA1C4339B;
	Thu,  6 Apr 2023 12:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2DA1C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-502739add9dso1270845a12.0;
        Thu, 06 Apr 2023 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAvv/otmGc3hwMXwQhQHoUuaDflO8xWMjxGu4buYhBU=;
        b=UYFWuwtQZE6dbI/L901jI2OuT9Agu1VXY2EejSe+o6TS7XLyjvoSWvDKcswwOjC+ae
         cyDDXDCmwHn6bMpkeUTzVFVaRnm3MTvUDi5n2jR7j0mc7w9M9XohOcQxoHRN8xt74wdg
         8pxGPiPLt2bBrOI65/sXwNQS6wpL7vSfl+UNJ57iOdrir3FNjkBAt2bMDYeGucin0a8h
         00IYrM1ypuEDqFqK4ngforUGZ+1nO82xDabjQUetehEC7fYmrDmlFpx8wJA+a79OD2HX
         gVjmDzZ6QlHbfViR+TSQTykseB/NGyAqLHRiAzgldDT3wI/DOr01d3fz0DZ2p7ot+pOG
         ah+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAvv/otmGc3hwMXwQhQHoUuaDflO8xWMjxGu4buYhBU=;
        b=dHopb0v6xnWIiPyuiq+zFepr3GpQjzHYA4oUQlQVoRy4ZKt/0IG5W08466z1q9N1dU
         7huzKkqvNvejAmQdnhHHQvIzvCp6etZ0M6EjJQ7Nu1no8WyrmHHkM0E0a54GnGqrr18a
         pBa62r/0rYnEeEJyh3BpFzXScLCcRGjUdqYVPBdZA2sghVCvkfcRJQ60sOE6T6wt3JWW
         UbALj5nzAz3e89npRUtGt1FEmcX/72d9QNWi06tDDs8x9Kji/udXvIa9GoqpMgrLA0FQ
         qbt/rNcQ9mH9RRT08DTEVcdU0gdPfrz4pvFTM/yIBBFnXo2qWEaiqNEQogDYe17nKSoQ
         hySw==
X-Gm-Message-State: AAQBX9cwZ3xJu3HVI1x37jzSuN0OuVPnR+xLR07Q7w5UAcvf9W0dRUTZ
	abMJWJmLxroNhrGFcIfjl5xn5+47kwA=
X-Google-Smtp-Source: AKy350Z5ATxSZlSfguG4OpymE0cvmmmtJXCnwNBQv9rv/Ol+ovzictkZq8tSc3aSPoqP/5qlntn56w==
X-Received: by 2002:aa7:c50b:0:b0:4fa:e129:31cf with SMTP id o11-20020aa7c50b000000b004fae12931cfmr5437923edq.23.1680785284856;
        Thu, 06 Apr 2023 05:48:04 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y40-20020a50bb2b000000b004c2158e87e6sm697255ede.97.2023.04.06.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] ARM: tegra: Core changes for v6.4-rc1
Date: Thu,  6 Apr 2023 14:47:58 +0200
Message-Id: <20230406124804.970394-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-arm-core

for you to fetch changes up to e8476011f04b1ee4360f755ed19cbbddf12dc83e:

  ARM: tegra: Remove MODULE_LICENSE in non-modules (2023-04-05 15:03:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.4-rc1

This contains a single commit to drop MODULE_LICENSE() from a driver
that can't be built as a module since that can now confuse tooling.

----------------------------------------------------------------
Nick Alcock (1):
      ARM: tegra: Remove MODULE_LICENSE in non-modules

 drivers/amba/tegra-ahb.c | 1 -
 1 file changed, 1 deletion(-)
