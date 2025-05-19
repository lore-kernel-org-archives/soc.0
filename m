Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D30191F7E
	for <soc@lists.linux.dev>; Mon, 19 May 2025 02:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747621371; cv=none; b=lUHuIHDadiy4ngArho9SWEHBBnZTWOqV1fmbFVFuve5KBel7VVS56w5ET7d+79aQ1ufDFt5lRvIVdI7TnbnPWBRL4c7jg8enWcNM/zTcXBGPIlk7tSBYO+0YtLL4cVNB7MYrt3UBBcaaKW3gUrad/TnwMk74T8I93pamTin12Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747621371; c=relaxed/simple;
	bh=lwBGVAglvYgWOay7MWmzHZ6Aun6zQmV37J+nbQRDHhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwP9hZWoUyY3RA0RLskzVlIgenntd/VNdnbzm8V7JeHiFgV7Amsus/d+ZMnNwlUS1zgCa7abVtWChbpD/MZWVzGtGvuUKmpOojihIDsLpjD56NcOrs+tB5HEeNRvQ+4CvgK8ohNmQudRCG/4WZUezBCxYps8oa1SCEBt7aLi6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=Kic4Tx2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="Kic4Tx2X"
Received: by smtp.kernel.org (Postfix)
	id 80979C4CEEB; Mon, 19 May 2025 02:22:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BEC2C4CEE7
	for <soc@kernel.org>; Mon, 19 May 2025 02:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BEC2C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-601dd3dfc1fso1367445a12.0
        for <soc@kernel.org>; Sun, 18 May 2025 19:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1747621368; x=1748226168; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgPwlQ3V1QRI9qtvIn4Xbfg5FdP8EYBmkF1+/Mphpgo=;
        b=Kic4Tx2XBx1wRtk05TIfd/VEICe1KdqVTwEaNOIRLxsxcLcF1Evsmwa27q1yzkTYE7
         qjayoaLsHY0HzijtQUuRswo3QfsutnUw5H4uaaHHJFFqp1sLWFVOC4IbZqXx79WzkcEf
         dSqzz8uV3X0T3C3fVRX1UjfKQMwIE3ohFInmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747621368; x=1748226168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgPwlQ3V1QRI9qtvIn4Xbfg5FdP8EYBmkF1+/Mphpgo=;
        b=pT4ercrejUYxq8o7qiO7fCvcXDExL+anE8HSUv1LwvRq09WxIA62dtqYils1ndJ9LK
         kJbxZR5ko+MZIALlUHSB5338IA9hm57TM1VetIKPyF2OSe1bm/xUsFaySrjMGKGT/QK/
         zVCwD+tW9aOB8FXzvmEDnpcELoUNVqdVzGksuhzsPmNz81UXnjQi8rg94IE0SPHtcHQU
         rJTxrWZJz8HUEM7EVhyGRjA8E/WetZArJMcdq4+taWTOeCJLwOO7N2H29b0Ve27+VT61
         cv0JEBWUh9Qrdm417+dfpF3WhiXjey4VR/Gl/zBiub+RlsfdpWwL361IcCbxn7IBEBlD
         pxHA==
X-Gm-Message-State: AOJu0YwBKFB/8gSADT1ZRXPftyYNxvEv7eDOa61vrfCAtdtfiCZiljZX
	ceYZIWzJCKAsjXqpIBzkPeKlzMqNdvYu6KiyZlw8b1dK47+GdGH965f8pNBaYG+r+rvYWb/VOlE
	C5ynR9yIjCKVqUnIsADj44yIuy57F962AUFGU
X-Gm-Gg: ASbGnctWNTj0smlhIyWMVd1yVSgSnM5slBDvuUE/hcQzHFQ4G0/auM292Z50B8WkF/O
	Luz7NqLDzIoivvIPqKF+YRFy4swK7KjWxvNiJDbB8RQL6/vAjD2DjktKlhxiQgyefxWwMv0bnrv
	1DP1Vl272TNbOmtKj7YIyr0e0Yj4tKrRif
X-Google-Smtp-Source: AGHT+IFicjBynjH9uDuPTPcovcervueKk/qrETxIQ3ouE/hg9HV8KOFgvLMlflL0TXT5GEYtsMoDtJp9g6T3VtKHpVI=
X-Received: by 2002:a17:906:ef07:b0:ace:bead:5ee6 with SMTP id
 a640c23a62f3a-ad536f9d461mr772538266b.37.1747621367635; Sun, 18 May 2025
 19:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
In-Reply-To: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 May 2025 11:52:35 +0930
X-Gm-Features: AX0GCFvn8zJVewrJp6DGAq-ZrU_lB-AVtzRjhX-cF_3Sh8nYyVdah7YPE2XjXqo
Message-ID: <CACPK8XeRqO1qouB9eioo2roGEXUm6c_V=s7ccA6qL7QQiqANag@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: nuvoton: soc changes for 6.14
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 11:43, Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Arnd,
>
> Here's the Nuvoton 32 bit arm pull request for 6.16. Andrew has prepared the
> patches and created the tag, so all credit goes to him.

The subject has the wrong version in it, as you've probably noticed.
The rest of the details should be correct.

>
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc
> tags/nuvoton-arm-6.16-devicetree
>
> for you to fetch changes up to 7efb8b92165fea427a03df87e14d519b8acf57f8:
>
>   ARM: dts: nuvoton: Add MMC Nodes (2025-04-08 11:29:38 +0930)
>
> ----------------------------------------------------------------
> Nuvoton ARM devicetree updates for v6.16
>
> - MMC, OHCI, UDC and EDAC blocks added to the NPCM7XX DTSI
> - Fixes for GPIO hog names in the NPCM730 and RunBMC Olympus platforms
>
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: dts: nuvoton: Align GPIO hog name with bindings
>
> William A. Kennington III (4):
>       ARM: dts: nuvoton: Add EDAC node
>       ARM: dts: nuvoton: Add UDC nodes
>       ARM: dts: nuvoton: Add OHCI node
>       ARM: dts: nuvoton: Add MMC Nodes
>
>  .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 108 +++++++++++++++++++
>  arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |  12 +--
>  .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 120 ++++++++++-----------
>  arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi     |  65 +++++++++++
>  4 files changed, 239 insertions(+), 66 deletions(-)
