Return-Path: <SRS0=fw/+=AD=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473B9C77B6E
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 14:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03F39C4339B; Wed, 12 Apr 2023 14:03:48 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2133C433D2;
	Wed, 12 Apr 2023 14:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2133C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id z16so7396815oib.9;
        Wed, 12 Apr 2023 07:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681308226; x=1683900226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkKJbGcmCESOp5kGHyfKWXGMOOU/ouU4bAVhUJXQjqA=;
        b=VndVXASXS2HnO573wbRyAiymjXidcgY89zlCU0776tcvs3LYSdfc6bGVzVEz/JED/k
         TIDsHpMEeT2t8ooHsgXDhef2r1KGIA3ue8tNgjOoBAa+6exWPPyu+v28GvPw44WLTxlX
         Gg1ZeCWSq6tuIPekVKUqCdZAEq/YsIQOysbMC4Jtrs/WowBQ9WKWGc6CESd1wCES7ZhK
         IUrj/j22duOlOq6ML7coVWsMF+TBtMP0JIUh9l6MY/F7y9v5qydCYdDWjwhKg6+oTOHH
         tQVyOJX/qHMCDtpVz4XVbDKoVjzojVUhhu6AvXF6fVzVg2u9xE7bYn9G4qjGsiOyPH3v
         YozA==
X-Gm-Message-State: AAQBX9fLrS3aPM0OM+x/8WQPWRCe3YbwP1v7CT0VLxWtaiqCdvoE6pTi
	Elcr912qqolsKuwEY3pT/A==
X-Google-Smtp-Source: AKy350Y4tWN4Ri2Yf9zEZz08i2glwRo8Dr90/wmyCM6hmihMUWaqoNcTtQG0LOp2GloTALjDW2dmog==
X-Received: by 2002:a05:6808:352:b0:38b:a4f9:2570 with SMTP id j18-20020a056808035200b0038ba4f92570mr3031262oie.16.1681308225748;
        Wed, 12 Apr 2023 07:03:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p5-20020a4a95c5000000b0053a7aaa85a0sm7063881ooi.0.2023.04.12.07.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:03:45 -0700 (PDT)
Received: (nullmailer pid 2248174 invoked by uid 1000);
	Wed, 12 Apr 2023 14:03:44 -0000
Date: Wed, 12 Apr 2023 09:03:44 -0500
From: Rob Herring <robh@kernel.org>
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>
List-Id: <soc.lore.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "sboyd@kernel.org" <sboyd@kernel.org>, James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matthew.redfearn@blaize.com>, Neil Jones <neil.jones@blaize.com>
Subject: Re: [PATCH 5/5] arm64: Add initial support for Blaize BLZP1600 CB2
Message-ID: <20230412140344.GA2234522-robh@kernel.org>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
 <20230406102149.729726-6-nikolaos.pasaloukos@blaize.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406102149.729726-6-nikolaos.pasaloukos@blaize.com>

On Thu, Apr 06, 2023 at 10:22:32AM +0000, Niko Pasaloukos wrote:
> Adds support for the Blaize CB2 development board based on
> BLZP1600 SoC. This consists of a Carrier-Board and a SoM.
> 
> The blaize-blzp1600.dtsi is the common part for the SoC,
> blaize-blzp1600-som.dtsi is the common part for the SoM and
> blaize-blzp1600-som-cb2.dts is the board specific file.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  arch/arm64/Kconfig.platforms                  |   5 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/blaize/Makefile           |   2 +
>  .../dts/blaize/blaize-blzp1600-som-cb.dtsi    | 217 +++++
>  .../dts/blaize/blaize-blzp1600-som-cb2.dts    | 103 ++
>  .../boot/dts/blaize/blaize-blzp1600-som.dtsi  | 104 ++
>  .../boot/dts/blaize/blaize-blzp1600.dtsi      | 894 ++++++++++++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  8 files changed, 1327 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/blaize/Makefile
>  create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-som-cb.dtsi
>  create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-som-cb2.dts
>  create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi

New platforms should be free of warnings from 'make dtbs_check'. Please 
run and fix if you have not, and confirm that in the commit message.

Rob
