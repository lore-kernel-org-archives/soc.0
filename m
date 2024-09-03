Return-Path: <SRS0=sv4b=QB=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A9BCD13CF
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 11:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6738C4CEC5; Tue,  3 Sep 2024 11:06:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCFF8C4CEC4
	for <soc@kernel.org>; Tue,  3 Sep 2024 11:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCFF8C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5343d2af735so5079377e87.1
        for <soc@kernel.org>; Tue, 03 Sep 2024 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725361591; x=1725966391; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V8DEEQFam0EEBOR4AupnSXl0ISxgp+Mzb+eoFbChIc8=;
        b=zXduFxLssWPoxKaYIc1GQt/cKi9Yu5yaUXBR6wKPnUG5yRxbrtn4ooCxNahMSc8TF9
         D0v8ca0Y6hGJBw5MJ7H6yamLuwr6xH+9tU7OMdrX6EQGOOiiU5MQJEMzMRB5MpgFHR1k
         5q9m+dQVPI9pj8ymLVY8sHwGdQINGWspy84IzlegrpXnsayabaqyJFcVBOd8z27dpsCg
         GcTjEh7M5mamZ/QQSyUPapWwBrZ86Eq7WsOcBZqUYY2FV6IG7iJJuw37L2Br/cMYkxM2
         kyZK8A0IrpZ4jsplu69liPF5nbHgOHOzLViyEpKlRq8XkXukVnWvjrw6kuEN4DTWUjSw
         qFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361591; x=1725966391;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8DEEQFam0EEBOR4AupnSXl0ISxgp+Mzb+eoFbChIc8=;
        b=ucpYnNI4FtISH61dfjG0uIbJkdCIXcxvxMs56mODSl0bOz72TTQdd9iPifGE19Xj0K
         PYsqXTuqPgxeA2AewLRP2CSn+iVKjhDQxRqTPUk96OGFCj2n5SshGiqLFqT4+kpJp7n2
         hgynTvgPOYBNY5kxFLEJwH11dSO6UcywBuzwZvAP2UEQzgB1XsVMYeTlTk8Me5Rwdsr1
         T96HB78JiEFniM7n/NcU0oOoqL3lD2957PAUoupKYYTNo/Ru+noHPQuvMBOjzQ14RRDX
         WZvAz3mmYDoqNdPKf6t91WJNsQ+fylVS3VpQKETOLDtVVPX4FFaUfEATQgDd88rce4co
         GPHQ==
X-Gm-Message-State: AOJu0Yzl3c4q0LzfxV9vMFCOKff7fcMAZCO+o0XL1fEzkfxfHnvKS4Mo
	fF8FxwW26t7AmPc8QpD23ydjKhyDXqfgaZn+Vo6RZTCQm/NY75IZzlPZCeUtEJi591Jebmggvgt
	H6FXJWQ6uJFO+m6QZxH1xb9hZ67DzM4kMFWN+aAE0VIGdY9EK8NE=
X-Google-Smtp-Source: AGHT+IHajMjuDn/tQ2Az3Wc46UKC6VDtLNIqkRciHP4/wT4NeKMphJGvl9EFA5MOMgaKCiQhvguJX/tDNoQltSkvkGM=
X-Received: by 2002:a05:6512:68c:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-53546bb4d04mr6951677e87.56.1725361589978; Tue, 03 Sep 2024
 04:06:29 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Sep 2024 13:06:19 +0200
Message-ID: <CACRpkdahXECZXWA5uv=SZtkzU0E++fQj7QWK8kYuH0-asLUPqg@mail.gmail.com>
Subject: [GIT PULL] Integrator fixes for v6.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are some ARM Integrator fixes for the v6.12 kernel cycle,
details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/integrator-v6.12

for you to fetch changes up to 15a62b81175885b5adfcaf49870466e3603f06c7:

  bus: integrator-lm: fix OF node leak in probe() (2024-09-02 10:18:43 +0200)

----------------------------------------------------------------
Integrator fixes for the v6.12 kernel cycle, some of_node_put():s
were missing in the SoC drivers.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: versatile: fix OF node leak in CPUs prepare
      bus: integrator-lm: fix OF node leak in probe()

 arch/arm/mach-versatile/platsmp-realview.c | 1 +
 drivers/bus/arm-integrator-lm.c            | 1 +
 2 files changed, 2 insertions(+)
