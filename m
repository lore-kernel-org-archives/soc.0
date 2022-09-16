Return-Path: <SRS0=nkI+=ZT=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A91C6FA90
	for <soc@archiver.kernel.org>; Fri, 16 Sep 2022 10:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB22BC433C1; Fri, 16 Sep 2022 10:20:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09C78C433D7;
	Fri, 16 Sep 2022 10:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09C78C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id a41so18958333edf.4;
        Fri, 16 Sep 2022 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qRPxEH0BmsasFGXf0kFOuTMDaUftPRO1xOsInmi8dN4=;
        b=GVLcNnbVQx9Z3Z/kgLLbR++GR8NMvtqseEy5zKva63x2uyB4XsJgUbL2leZNA0FMWk
         dp7h5VsiwfnksZ4V2niCoQZJ1KPVtSzflXALo84ZWTvsKUvZRIKOivz2C30Ls/a72SJG
         /2nbgnwKxU2QTxmw3FwvEeC3KrI/s3eGAS9a6gGccNCdxTTjRarY0RuRqPo5nm1RX3ur
         ARABAZI1hJxN2SptHI+Ls37OA0MGVjpAgbusY23ePI18crvu9WyhwWo9vZUZcpT2YmLr
         S6HLnnEPdKKKCDtKEo9CC5LGgYqEkv8n2uqN41lZYDcbYW7P3F/XcdiHcyjL26+ImYQH
         bE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qRPxEH0BmsasFGXf0kFOuTMDaUftPRO1xOsInmi8dN4=;
        b=ClYFAidKBGLnpy1Z9y1dbBDUvxYRXjLzzUszwWZBwpBt9kVjrM6+uRtIAdopxooikQ
         nmDarxxcTOyRbVUgHGOmAU7gk+K33BoKlTSzvwSuwKS9y5pXxyVlxOQ0h8RVrYRgmCfo
         f6vvXqC1NKv3mHDKR5qLLuijKvGKsU6cEyHoL7ngTHseemT3+/FZjZadJv3pBolR0Gx3
         oUDKO4pTEwjTDQ2kmayR6c4zI8xXg+T6gbK8Vlme09l2WxdR7p00A3+/6K2QetGGWlfG
         MjPdWEFsdu0CdcAcTPDVkdlcrwC/4jNgTw3GDTV1zBjO4mR9wOos+me6ISfK8d7tvi60
         13lA==
X-Gm-Message-State: ACrzQf1VQ/uH3hanNVOfKSJcvPfYQreJ9H1jt4Yxl3PCLrNn414Cu43g
	fITRff7rXBy+jwgDXnHqoVyKjjQraVQ=
X-Google-Smtp-Source: AMsMyM4mAAK0cfGaBzKvbXxnntafEP7K7LsD4z/SWhiWdekUK57oayChelRyx6ilxNA71Q8jPX+7jQ==
X-Received: by 2002:a05:6402:5243:b0:451:6d52:5928 with SMTP id t3-20020a056402524300b004516d525928mr3389755edd.328.1663323606786;
        Fri, 16 Sep 2022 03:20:06 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906308c00b0077fbef08212sm5707741ejv.22.2022.09.16.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] dt-bindings: Changes for v6.1-rc1
Date: Fri, 16 Sep 2022 12:19:55 +0200
Message-Id: <20220916101957.1635854-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-dt-bindings

for you to fetch changes up to cc99f95d49b3ee4617bb4154e32ae7ac14755fe2:

  dt-bindings: Add Host1x context stream IDs on Tegra234 (2022-09-15 14:05:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.1-rc1

Adds device tree bindings for the MGBE found on Tegra234 SoCs, as well
as stream IDs for the shared host1x context devices.

----------------------------------------------------------------
Bhadram Varka (1):
      dt-bindings: net: Add Tegra234 MGBE

Mikko Perttunen (1):
      dt-bindings: Add Host1x context stream IDs on Tegra234

 .../bindings/net/nvidia,tegra234-mgbe.yaml         | 162 +++++++++++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |  10 ++
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
