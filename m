Return-Path: <SRS0=ZoBd=O6=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA712C433EF
	for <soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:58:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B829E610D1; Sun, 10 Oct 2021 17:58:43 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322C760F45
	for <soc@kernel.org>; Sun, 10 Oct 2021 17:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 322C760F45
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BCB4540013
	for <soc@kernel.org>; Sun, 10 Oct 2021 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633888720;
	bh=NrDH+pD98VXNyjr2vH7l+H1QFNZaZ87D1CmJMseVHwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=QZCykrbtHBkTcGpPQ6Q3SGqjz5awgscmHnj9bNhxq31UU7rhXl2rd0Noc4vwiDQHe
	 FRujc+MHWUN6lvFyab4nIrAYZ6lQI6MKWv1aHnfJKFC9vTS6T3T8PjKi1Jxm5tKi50
	 AG6BBliATNpKih981ShdeIwc5EnUf+hc2OTtFl0koRkn3f2DqdL+EAecLviInAaGWU
	 Na01I0zZYz7nysU/PNLa+j0PjUl/SvEnOC+eBLd7faOweg8VnosQ0ccA+wetQI6dmO
	 eJPzOMZ9pNEBLd5i/G4ElNeiHEs39AsLBkpZ5bMDMnoAgVHm4ZkuBBMCLsZl/uTpUY
	 rz2D/VK1rGQCA==
Received: by mail-ed1-f70.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so11687005edy.14
        for <soc@kernel.org>; Sun, 10 Oct 2021 10:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NrDH+pD98VXNyjr2vH7l+H1QFNZaZ87D1CmJMseVHwg=;
        b=7JoqKohAlIvnJy4bKG5mE8IHdzBM2ly771Je6/S20l3UcXIfVjhIqsDVL7pN42/ujs
         2Z2SWg6jdC7EaKOaSRHDtgH+0v1cSHeMiyPecdj/zpANGCUFf5eT6rD8CpaCbvVri7kz
         DmM/ol7N0vzeFXx12ZXV+v/IGtBYF5xLLtEWhI0mEZ+Kc/o1FgL6I4ntvwkTyB530KqU
         /2AMMDiQPruotV1Q4UHwJV4Qe10tRMmpwZZJoIvbagdymK6gEf0H6pPI56S/B9LlexD+
         RVC2h+6Nl4lLkOaPrLj1AEM7YaeAEspwQfmf9z1kVZxiiZfOrHz0d3poR7BL1Bd62zxe
         N+Vw==
X-Gm-Message-State: AOAM530KCLuTWbqfDqDCtaydyKhdvMT/vApXfp8mh9I6uwUXBCTediNS
	nLhhyrHwBq6eL+7Ntm4AuswcVDwhIAtMB/dWACfH52stpUT/OYhphD5okmoHSKD9yYnDPm7Ohqv
	AwHD233277/2VWZTMFPUN5C8=
X-Received: by 2002:a05:6402:410:: with SMTP id q16mr34342278edv.286.1633888720339;
        Sun, 10 Oct 2021 10:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRBcHo7+oZQEmrhMN0Ckl6vC4HpNLDrOgA8llriI5pHb/ju1hwmod3EdbAZOO9ZCwlbohnQA==
X-Received: by 2002:a05:6402:410:: with SMTP id q16mr34342257edv.286.1633888720207;
        Sun, 10 Oct 2021 10:58:40 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id au26sm2347948ejc.53.2021.10.10.10.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 10:58:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] memory: drivers for v5.16
Date: Sun, 10 Oct 2021 19:58:34 +0200
Message-Id: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.16

for you to fetch changes up to d611d7ea120bbef45e836565dfa2ddc85a168c16:

  Merge branch 'for-v5.16/renesas-rpc' into mem-ctrl-next (2021-10-10 19:45:00 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.16

1. Renesas RPC: fix unaligned bus access and QSPI data transfers in
   manual modes.
2. Renesas RPC: select RESET_CONTROLLER as it is necessary for
   operation.
3. FSL IFC: fix error paths.
4. Broadcom: allow building as module.

----------------------------------------------------------------
Andrew Gabbasov (1):
      memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash

Dongliang Mu (1):
      memory: fsl_ifc: fix leak of irq and nand_irq in fsl_ifc_ctrl_probe

Florian Fainelli (1):
      memory: brcmstb_dpfe: Allow building Broadcom STB DPFE as module

Geert Uytterhoeven (1):
      memory: renesas-rpc-if: RENESAS_RPCIF should select RESET_CONTROLLER

Krzysztof Kozlowski (2):
      memory: samsung: describe drivers in KConfig
      Merge branch 'for-v5.16/renesas-rpc' into mem-ctrl-next

Wolfram Sang (2):
      dt-bindings: rpc: renesas-rpc-if: Add support for the R8A779A0 RPC-IF
      memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode

 .../memory-controllers/renesas,rpc-if.yaml         |   1 +
 drivers/memory/Kconfig                             |   5 +-
 drivers/memory/fsl_ifc.c                           |  13 +-
 drivers/memory/renesas-rpc-if.c                    | 159 ++++++++++++++++-----
 drivers/memory/samsung/Kconfig                     |  13 +-
 include/memory/renesas-rpc-if.h                    |   1 +
 6 files changed, 141 insertions(+), 51 deletions(-)
