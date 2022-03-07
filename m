Return-Path: <SRS0=ZOfN=TS=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE498C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E337C340EF; Mon,  7 Mar 2022 08:26:00 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AFDFC340F4
	for <soc@kernel.org>; Mon,  7 Mar 2022 08:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AFDFC340F4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B05163F1AF
	for <soc@kernel.org>; Mon,  7 Mar 2022 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646641557;
	bh=4WIPZDs1A+/ztSWSMIGd9RnjoSgJeXHblH2bIob06Us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=BEs9Ctn9PdO9AMWnHl8aa3x2zZ7m6g4akw7eaDUpfXk95ewtSv8sfTL5yc9pFF9o4
	 lC1718cP5MEO2Zt5KMgfyGjygL36Gl2+Fxu6fU02uTyQUkwKjhEGDyJryosGsS/tzo
	 XVV+ibMOvDn3t2ksbesTK34omnJO0lMWZRy51h4eMAmdT0YtYrup9fO2WOOyhuquJA
	 giBaDuZZQvpMFdSmqWLgRsZc+llISk7xfcZQ2SphBH7Iq/NIOASK50wDr1Yx+SRNtK
	 nzRFfi3X5bu6eg9WAy0JexA2gxiZQVaQ54Eip/M+eU/eP3m3rMsJEWob9VKhGh1g8x
	 iaB8nn3GsUoPA==
Received: by mail-ed1-f69.google.com with SMTP id i5-20020a056402054500b00415ce7443f4so7243785edx.12
        for <soc@kernel.org>; Mon, 07 Mar 2022 00:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WIPZDs1A+/ztSWSMIGd9RnjoSgJeXHblH2bIob06Us=;
        b=PZqtAaPs4bypoJ8eB8QRW9hq8qJrC4O9kbjBrJ5bPkltLHGIlWfEvvQo615YuQXKwx
         /CE1+b+Ao64XIfRtzm9d+TTniYnJn6b63fKSlWS8zZq+xWkW7O1bWF4SRvmjoI7cOY3+
         aW4oWU4vQEVzeN9KWx5Ltxpp/NXbDDnG3NiUbBDuZW1YAPM0LWdYaooZ8v2+Mdg3n6zy
         dgVw7guClSItbLFtsKHmAlH7iW52X7KoxiWwjyJ+4NQMi/+h2a7mfo0WMa4p633TRkaJ
         Z8BZrcozkcE33uwa86ON3GzxL1tbVT8Jwt3h8rHRQKu4/vzP057BBDqAi9+1JofYTV2S
         L1OA==
X-Gm-Message-State: AOAM533XftqJeZh0NhxV4/lNshx4gLIQ1ODP60+kc6wMRKLU8fXqAkUV
	HEEJOXmUnhCXfN0qru6xo8gr+/OaibPxGMbCNUGEcXcVuzaPOTSvY139Y7zh5pAwhWy61JN1iBl
	mJwdisvmHZejrXuw7Fqy+ys4=
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr8063229ejc.712.1646641557281;
        Mon, 07 Mar 2022 00:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3PnjZMFJvegI51mXQwwX0sRYgYwW8EY4J4ZgrQfsyrHK1k4RLdJcsXQGEpnSPKZJdgRK8AA==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr8063220ejc.712.1646641557106;
        Mon, 07 Mar 2022 00:25:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id qp3-20020a170907206300b006da96b87e9csm4207080ejb.181.2022.03.07.00.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:25:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v5.18, part two, late
Date: Mon,  7 Mar 2022 09:25:52 +0100
Message-Id: <20220307082552.55719-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late minor fixes for v5.18 memory drivers. On top of previous pull
(tags/memory-controller-drv, soc branch: memory/drivers).

If these are too late, please consider it also for fixes after merge window.
These are not typical merge-window fixes though (issues existed for long time).

Best regards,
Krzysztof

The following changes since commit a06bf59d07f45a0a6ab4ab8ac69c1d708d3fadcb:

  memory: Update of_memory lpddr2 revision-id binding (2022-02-25 13:36:49 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.18-2

for you to fetch changes up to 69d6941949ea8a113ffc89410b0cb79bc7b35a0b:

  dt-bindings: memory: renesas,rpc-if: Document RZ/V2L SoC (2022-03-04 09:09:52 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.18, part two

1. TI: Two fixes for TI EMIF driver for quite old error path issues (so
   for unlikely scenarios).
2. Renesas: Document RZ/V2L SoC in bindings.

----------------------------------------------------------------
Jia-Ju Bai (1):
      memory: emif: check the pointer temp in get_device_details()

Jiasheng Jiang (1):
      memory: emif: Add check for setup_interrupts

Lad Prabhakar (1):
      dt-bindings: memory: renesas,rpc-if: Document RZ/V2L SoC

 .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml    | 3 ++-
 drivers/memory/emif.c                                             | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)
