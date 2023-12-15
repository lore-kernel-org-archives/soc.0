Return-Path: <SRS0=bqrc=H2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16412C4167B
	for <soc@archiver.kernel.org>; Fri, 15 Dec 2023 18:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC54FC433C8; Fri, 15 Dec 2023 18:56:06 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB247C433C7
	for <soc@kernel.org>; Fri, 15 Dec 2023 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB247C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5e2bd289172so9024317b3.0
        for <soc@kernel.org>; Fri, 15 Dec 2023 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702666564; x=1703271364; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XRln362Pc8OetNsXpHejnF/bGcM9sYDWfAA0KhpXbDY=;
        b=gu8YK+mg2vexyalB1if0rUuT+h1w8LNt3sxIqR2R31SsK3bwXzcQxaSGRrmcIVxxTE
         /osdUjWI818EqZe0m+enIeyRLvY+FO/ZLklGDPljGJxUvwOnn5wn3i4pxGOL2Kiqxc87
         lZfifFpLmEd2anM01IRktPmzOz9fadQfFCf93vMztVrIbZFwpbzxjGzcA/GqXXUNANbZ
         ETc3YktjoSFT0WQ+f5g3Vb8aJLYhNPjLi+FAoXmLuYAGYEo5IrjZt7xi5CJ8A79gW6oB
         bt6na4XePtwXdQxCG21/APcIFJa/+sa0ZajUUszjur7P5TI62dkIqmvw/qreoqkbfVNS
         ehOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702666564; x=1703271364;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRln362Pc8OetNsXpHejnF/bGcM9sYDWfAA0KhpXbDY=;
        b=LWwWn6HL63UT93oXstv5pZlG+PQfHDu3MCaK7RiFi69/es1nrWc1i1PQAgNhkg2v1d
         egt3CqlDNRv6lmB0D5ac/WXL80XxczxJHJe1SJ7j0+1970U47/CyyimNju5YzKvp1eBZ
         DC0wgmKZQ4jj6arQTMufk54xU2lqzuKg4K8bWLHW5K4wu7EwwDLnS07PMxjIxV3WwMzS
         MCToyVmtHIrkqtE5OCsgOOrTIqV7uXVACI6ERK83iubEAfGq5+jlZvpaQ72Y3i61oc45
         YA43jdgU0Y3vt9es24uIOlrK8iSl9bi9mCSrUviIenMuDQuv2cjerZm4SRN3iFV8kaIJ
         PlJw==
X-Gm-Message-State: AOJu0Yx7CQ44UawTIbqFwHNkKttODAAkzda0Oj4Sp+H/vBhNU03V//eW
	L42DnlcOw/L5IQiu1DXJZtqIF27EhgPF8Ccs+i2QzDrEzkMebaZeWE8=
X-Google-Smtp-Source: AGHT+IGVhmORIS9OqdZtB1CN6i/gcPZeIA5dkRLkfzbS/ijUOSx7NhaaodRknt54krGOcbkqdI7SabXHJpejwn3uRZo=
X-Received: by 2002:a0d:f682:0:b0:5d7:1940:dd84 with SMTP id
 g124-20020a0df682000000b005d71940dd84mr11275192ywf.90.1702666564433; Fri, 15
 Dec 2023 10:56:04 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Dec 2023 19:55:53 +0100
Message-ID: <CACRpkdZ9wCV7oohF2KX6MFwmuSPR_i7et8O5SH=op6gyQ4mOvQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 HREF520 DTS regression fix
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

this system is probably only used by me so there is no rush
to get this in, please pull it for v6.8.

I sent a single DTS patch before but they should not collide.

Yours,
Linus Walleij

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ux500-dts-soc-for-v6.8

for you to fetch changes up to 4ecae2ae9535cf1509b9404080b448bce179d662:

  ARM: dts: ux500-href: Switch HREF520 to AB8505 (2023-12-15 19:50:30 +0100)

----------------------------------------------------------------
More Ux500 device tree updates for v6.8

The HREF520 reference design had the wrong analog baseband
defined causing a boot regression.

Was AB8500, but this board has AB8505.

Rearrange the device trees to make it possible to define
a different AB and slot it in.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ux500-href: Push AB8500 inclusion to the top
      ARM: dts: ux500-href: Push AB8500 config out
      ARM: dts: ux500-href: Switch HREF520 to AB8505

 arch/arm/boot/dts/st/ste-href-ab8500.dtsi      |  48 +++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi      | 490 +++++++++++++++++++++++++
 arch/arm/boot/dts/st/ste-href.dtsi             |  55 ---
 arch/arm/boot/dts/st/ste-href520-tvk.dts       |   1 +
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts  |   1 +
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts    |   1 +
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts |   1 +
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts   |   1 +
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi      |   1 -
 9 files changed, 543 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/ste-href-ab8505.dtsi
