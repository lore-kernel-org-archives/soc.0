Return-Path: <SRS0=fmoZ=3T=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764EAC433FE
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 01:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DF94C43470; Sat, 19 Nov 2022 01:20:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60755C433D6;
	Sat, 19 Nov 2022 01:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60755C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id i10so16979360ejg.6;
        Fri, 18 Nov 2022 17:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmFuOrTHEENr0A/eY36A+2IKp7fUThsmTNG5TtipN24=;
        b=fuKBq441GX/qMK9rGLsMon9EAK7JesOvnbrMrvR8OjIQrGXc5q/i7cVv31OAnHIYeE
         GPzbSrFFJMt04zb/Fx6CFocYk13W7bwVxZoBky4bGHWbpdlbInMoxJLsCgG/n3XkZt6A
         L1hw/3DUBGMRHfAJtZDYKOmgCFYyBpauy2lstk42A00gP0V+TAS7cBeajPHxRhVlSbzx
         /auZ58diDD6koJnJci65fmOsSApa29WUnyYqYgavicyWw9vgvp1945WAow+chG65l/r7
         SiaWSW6U3V/9JQq0w2MtX7rzfY+6QB6SXotbtEeNKTY+/JXYc54nNFKJRqcCp8Gply7P
         bdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmFuOrTHEENr0A/eY36A+2IKp7fUThsmTNG5TtipN24=;
        b=llzPWuTpaKQCWVjVUskFKTCwpP2M3ZQZzjVi2WHSlZx6an/cRczZ+Lqa4DGALxgRBD
         CwhM4/lbFzZtO3csi2dkhbYeW6R5HCXTTN4+W/r6R7bCMjwA2hnHGaXsguse7CQ7Qy1/
         GQmCrqZbrg9hk6IN94GdkMJo+Q2lZwksuPSXbD87UWW6zXBSwA4IOGhMiKn/NbsZUbxE
         AiHaVL9E8iR+PmUBXWRCfw5n+G55aJmJPDnRUDafz8Qfosy4W1YyVhXQRKCSRf2skTHp
         s1MLT4uoRSuVnqERsxcc8/tqIU8VJzRMQ2RckOPOT3HBQN9yxoI+iG3LDGauvMz5YhUL
         v3ww==
X-Gm-Message-State: ANoB5pluCE8KDp3PBUEG8J0TJxKbmugxI30amN3Z51engSscxCm7Hrzw
	PFLeMyfhN5u1hAwK1OT5TOWSdYamSD8=
X-Google-Smtp-Source: AA0mqf61n6Z+S3vKVWNhWrJpDYkXduIJxrCax6ut5UiX05GW9v4W8O/w7gXzohJBphJBv3nT/zn75Q==
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id m4-20020a17090679c400b00778e3e28311mr8310103ejo.342.1668820830255;
        Fri, 18 Nov 2022 17:20:30 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b0073d83f80b05sm2345833ejh.94.2022.11.18.17.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:29 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] memory: tegra: Changes for v6.2-rc1
Date: Sat, 19 Nov 2022 02:20:22 +0100
Message-Id: <20221119012025.3968358-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-memory

for you to fetch changes up to 72cea2b0a9fba5c94841f4cb39b58402d8f174ae:

  memory: tegra: Add DLA clients for Tegra234 (2022-11-19 00:00:02 +0100)

Note that this pulls in a subset of the for-6.2/dt-bindings branch to
satisfy a build-time dependency on the new memory client IDs that were
added.

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v6.2-rc1

Some cleanups replace open-coded debugfs attributes and memory client
IDs are added for the DLA IP found on Tegra234 SoCs.

----------------------------------------------------------------
Jon Hunter (3):
      dt-bindings: tegra: Update headers for Tegra234
      dt-bindings: memory: Fix typos and definitions for Tegra
      memory: tegra: Add DLA clients for Tegra234

Liu Shixin (4):
      memory: tegra20-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra30-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra210-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra186-emc: Use DEFINE_SHOW_ATTRIBUTE to simplify code

Mikko Perttunen (1):
      dt-bindings: Add headers for NVDEC on Tegra234

Thierry Reding (1):
      Merge branch for-6.2/dt-bindings into for-6.2/memory

 drivers/memory/tegra/tegra186-emc.c            |  15 +-
 drivers/memory/tegra/tegra20-emc.c             |  15 +-
 drivers/memory/tegra/tegra210-emc-core.c       |  15 +-
 drivers/memory/tegra/tegra234.c                | 160 +++++++
 drivers/memory/tegra/tegra30-emc.c             |  15 +-
 include/dt-bindings/clock/tegra234-clock.h     | 639 ++++++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h       | 440 ++++++++++++++++-
 include/dt-bindings/power/tegra234-powergate.h |  15 +
 include/dt-bindings/reset/tegra234-reset.h     | 111 ++++-
 9 files changed, 1339 insertions(+), 86 deletions(-)
