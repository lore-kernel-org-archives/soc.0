Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAFF168BD
	for <soc@lists.linux.dev>; Thu, 11 Sep 2025 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757568216; cv=none; b=r+nPOkr5LDcPK+Dgl1TYQotJ30ZwKxraqWlbI9krXbsaTPQ8ac5fgzS/skCuGe4RviXNeEE0XblNp6cAOWLsv2PoYDK+oK3993KNKSrVj3w7mJVeEwvpSC5cMsu0dWOEHK04x6BxuW5ucvXyzJrtvmVcuGYAhjOEOvlPrCfp/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757568216; c=relaxed/simple;
	bh=7fkKAxq8dh0R6PDa84FQX6z+rAK+MlZ2IBC/BsduUUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+LnbNIBYzvr7Kb9Hf+rj/MpZnj38QX4bOS8QoDrsojp5eGzJf5NCV8BTenntp6BFfvuqWIBQoGgidopmePUGhIyd/9OQFdQBUbquSGnSiUxKoq0MSeMjQmo837j5fbGF8CW7SggN2aNxZWxWGNwimVllNHyHSGr5Dl4a1Ep0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nOyS1IyF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nOyS1IyF"
Received: by smtp.kernel.org (Postfix)
	id 02BB6C4CEF1; Thu, 11 Sep 2025 05:23:36 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30AA0C4CEF5
	for <soc@kernel.org>; Thu, 11 Sep 2025 05:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30AA0C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so284054e87.1
        for <soc@kernel.org>; Wed, 10 Sep 2025 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757568212; x=1758173012; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD8nn1i7Yhdi7+TnIzuBsyz3lWTKZHkEomf2hy/RkVM=;
        b=nOyS1IyFQX41AVn5IYj/Gi7HrdUcC8xQJi+GvBu+2543dcmnb2q/1tEnr4arU9agnY
         0lZuZ5anuKkKbOXJoH5e0PFp/CPBU7maeyX2VaXwu7jkPqQxwN1Yqhss+Ghv0/q3sxHg
         7nufGSphK+imi3T6uYR4d9CIX02nEqUgRomLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757568212; x=1758173012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD8nn1i7Yhdi7+TnIzuBsyz3lWTKZHkEomf2hy/RkVM=;
        b=rJ7Hlbqw/n1QpOqL1hfEozvYyrnZWEVrms3o6+rlS5+Re02I03J0uDcPZRGbspFzVW
         QC6FNRZdgAqsoAvlY82l8JyOy9f93u5PIV2YRHfraAONndyKA6YWHNGpL0uDa+hpMvfj
         3RZ9FIrIetwnl9LFdzjxbvV8khdAkRyFyHQtY7an5xUwEQU2D6mwhTXzNKAcriKrgby3
         IUl6EQakRjRT7jLcikWissjEom98KUVmMgH5UoFoX87qvFEm7m6jADHsMc7rOdGLQeaF
         PQJDKVrmXJfBjsZthbA0lFZro3OF68GbQdwEECMpTgVc0F0Wr0BPQduhoCwEoS2ChwQQ
         S6VA==
X-Forwarded-Encrypted: i=1; AJvYcCXYnQy2qeKNwa2Ed+QOH+PHuc4CCENEiIGOvpgY/HtRd2N9ucqrOTK+3elVOcF3p8O7Nxw=@kernel.org
X-Gm-Message-State: AOJu0YyYTxEj7FUvKKKMd0AX36CAnp3ZSgmv3q/xA3hxKjp3a7AQi7I6
	fZjzww2LMpK78PMVuzkxL4xBGWF7+aFtM5c/4esgUSw5IclHkjQR/6YEppN3mR/Jp+V9EbNwTrk
	Gb8cOZfM1byp6gq2chX9/tFhdlCwj9QINlsrtySrv
X-Gm-Gg: ASbGnctJzh4GQPm4noAPP1rDIvCYKbDGDDuLZxd9gR321/bMbfMyqseQXT0I8jg7wIC
	c+M+u1o2vbmQtewlpQ7jXrtWq6cN0W7pjG1dPAW7GMAt5rU4uHXxMavxsIJrVn8hlkf5mHEInjI
	zFPYlfisd4r7c44jsAyZSO+ovxQDhvvbxMqjBQuOe4B4p3sccipwpUtIYixnp4W93oTZNurPxE7
	bMJADxT74Vlhjiwj9tecgaA/uw2+GrE0Uh/rxqSOe6jY61p
X-Google-Smtp-Source: AGHT+IHsFO2dCnG3xagTwvzbaLyKjSsIEhuxrfLgoWTOpuWAQAOR7jHFD/yhONhTl/D9cmXdDuX5rvWYbwhJsjrUtPo=
X-Received: by 2002:a05:6512:3512:b0:563:2efc:dea7 with SMTP id
 2adb3069b0e04-5632efce08fmr4010317e87.34.1757568212192; Wed, 10 Sep 2025
 22:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
In-Reply-To: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 11 Sep 2025 13:23:21 +0800
X-Gm-Features: Ac12FXxOIWG_n6zS7cykVQ7wuyEIUs7mj_P9ko2kp2L5pATmRwMSO2clSnhg8Mw
Message-ID: <CAGXv+5F=uPnzrpDtPXc2ipwp5AhiEwGdxhuhPtjwWhAxWJMc_Q@mail.gmail.com>
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 10, 2025 at 11:04=E2=80=AFPM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Arnd,
>
> can you please have a look on the following patches.
>
> Thanks a lot,
> Matthias

I still have some patches outstanding for some time. Could you perhaps
take them as well?

[PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback
compatible to mt8186
https://lore.kernel.org/all/20250610063431.2955757-3-wenst@chromium.org/

[PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
https://lore.kernel.org/all/20250812090135.3310374-1-wenst@chromium.org/

[PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
https://lore.kernel.org/all/20250814092510.211672-1-wenst@chromium.org/


Thanks
ChenYu

> ---
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>    Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/
> tags/v6.17-next-dts64
>
> for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:
>
>    dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:=
16 +0200)
>
> ----------------------------------------------------------------
> mt7988 (bpi r4):
> * enable network
>
> mt7986:
> * add dedicated sram node
> * add interrupts for RSS to ethernet
>
> mt7981:
> * add thermal sensor and auxadc nodes
>
> mt8395 (NIO 12L):
> * enable UFS
> * add gpio keys to the PMIC
>
> mt8195:
> * drop reset for PCIe device
>
> ----------------------------------------------------------------
> Aleksander Jan Bajkowski (1):
>        arm64: dts: mediatek: add thermal sensor support on mt7981
>
> Frank Wunderlich (7):
>        arm64: dts: mediatek: mt7986: add sram node
>        arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt=
 names
>        arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>        arm64: dts: mediatek: mt7988: add switch node
>        arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>        arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gm=
ac
>        arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and le=
ds
>
> Guoqing Jiang (1):
>        arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from p=
cie0
>
> Julien Massot (2):
>        arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
>        arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys suppo=
rt
>
> Mateusz Koza (2):
>        dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>        dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
>
> Rob Herring (Arm) (1):
>        arm64: dts: mediatek: mt8183: Fix out of range pull values
>
>   .../devicetree/bindings/arm/mediatek.yaml          |   2 +
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
>   .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
>   .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++=
++++++-
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
>   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
>   11 files changed, 508 insertions(+), 23 deletions(-)
>
