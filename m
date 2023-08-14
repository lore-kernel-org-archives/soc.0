Return-Path: <SRS0=0kd7=D7=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86996EB64DD
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 08:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45843C433C8; Mon, 14 Aug 2023 08:32:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E722C433C9
	for <soc@kernel.org>; Mon, 14 Aug 2023 08:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E722C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31972944f30so944934f8f.0
        for <soc@kernel.org>; Mon, 14 Aug 2023 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692001954; x=1692606754;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNZQqo4ZyBJ6uD5xvDvqRAAFxsgCDJevt+fCQXqqKbM=;
        b=Q+Pex536L3molux4sK8DDSGu+CXwccqwirDZBktMhMBsQyyIi4lME088Ow7X8HbgfN
         4OfRJXH/52czUhOHz9P9zTpc67BjDNiUROHdMqzgjx89gedCVcMT4LH7aIrPVgjVxpij
         djHljCOoNUJIcDNXuxVc+CJgiHCQlybC92WhCLBoluxEcHArYz8ljHBob1XkTprAoSqy
         Xu1pJuIEFqf8/SKRu1nKFgTMLEsTGPc2A+lTJogPREw+cicz9Tz4OoCCQlfLMZ4I+/IK
         fLcJEY+Kj/8+uidrL/Q5oW3WxVngx2Nd+0qQkFZa29+2/wxt44cYF7yUaz8aS7u1oxRN
         EifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692001954; x=1692606754;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNZQqo4ZyBJ6uD5xvDvqRAAFxsgCDJevt+fCQXqqKbM=;
        b=LObfnsiDuKqbNCsa8Fb2QPMX+dt1BApE4qSAOzq54gfggau/A/4posa211RLJg95LD
         X6FriF6ejuPgfYenf3uLOhFBFKqe5eqMN1h9o/fyUu5Ij13O2PHz0FheGY/hQ0QuVXqa
         jD7IKX3Kpg4QrdmzSolj5NVrpQCmV5F8WUr8SyEv1P4Me593LZy6/seJ/zFnKrJztngl
         Mef5+JTVrAWk9sm1yMjQFyb7RKYpRMf0bM/uxcNmLT5kG55e+RnM1WI4rCHIkoa9MENi
         UyzINBhx1toiCetMF3NQLxM1nJtxfxC5XcU9ak7Lt2E+e6cCCWzKw3Q0XGDT864Uyzt6
         pWVA==
X-Gm-Message-State: AOJu0YzXnZyYcPxUW+/H0A7fWBFE9Q/ZxNs3A+wkF8dRJWWcezE4bwpX
	8mcESAdT0Y04gLMGiLzBH5TPmwYKxw3eXQk9EPOOKg==
X-Google-Smtp-Source: AGHT+IFpw2UevV0b66D8HHVQNNr1pcT09ia8HTpKoynucTBVV5Nx3qd0Lh17y+eOCUKa/X7KaevLbQ==
X-Received: by 2002:adf:e288:0:b0:319:6288:e4dd with SMTP id v8-20020adfe288000000b003196288e4ddmr4689591wri.71.1692001954294;
        Mon, 14 Aug 2023 01:32:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id i5-20020adff305000000b0031980294e9fsm16538wro.116.2023.08.14.01.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:32:33 -0700 (PDT)
Message-ID: <3f91bb89-bf7b-d967-a302-2a8e1b0c3b01@linaro.org>
Date: Mon, 14 Aug 2023 10:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PULL] final oxnas removal for 6.6
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-oxnas@groups.io, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Please pull this PR to remove all the remaining files for OXNAS support.

The other patches have been merged by the respective maintainers, Mark acked
for routing the irq-versatile changes via a SoC PR.

Thanks,
Neil

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/narmstrong/linux-oxnas.git tags/oxnas-final-for-6.6

for you to fetch changes up to b1627ad5f457c8cea08bb2ab6b24d1c0381fbe30:

   MAINTAINERS: remove OXNAS entry (2023-08-14 10:26:56 +0200)

----------------------------------------------------------------
Final OXNAS removal PR for v6.6:
- Remove irq-versatile-fpga compatible entry
- Mark irq-versatile-fpga oxnas compatible as deprecated
- Remove OXNAS maintainers entry

----------------------------------------------------------------
Neil Armstrong (3):
       irqchip: irq-versatile-fpga: remove obsolete oxnas compatible
       dt-bindings: interrupt-controller: arm,versatile-fpga-irq: mark oxnas compatible as deprecated
       MAINTAINERS: remove OXNAS entry

  .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt   |  4 +++-
  MAINTAINERS                                                    | 10 ----------
  drivers/irqchip/irq-versatile-fpga.c                           |  1 -
  3 files changed, 3 insertions(+), 12 deletions(-)
