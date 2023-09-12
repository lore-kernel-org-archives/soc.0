Return-Path: <SRS0=rXeS=E4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56033CA0ECA
	for <soc@archiver.kernel.org>; Tue, 12 Sep 2023 07:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15335C433CA; Tue, 12 Sep 2023 07:21:44 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88039C433C8
	for <soc@kernel.org>; Tue, 12 Sep 2023 07:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88039C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d78328bc2abso4970864276.2
        for <soc@kernel.org>; Tue, 12 Sep 2023 00:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694503301; x=1695108101; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2r0YpULLY6K+PxoHfEEwV/ucVHBZJ+Dpxajz81fyHs=;
        b=oVIIYGXZyxEhNOL+2mwc6ZXvd2TZ1+v8TXBvrYo4qlJ1JJ9HpKAPd8Iw3TiKqnKqv+
         7kdOlf53istnaaulCkYGW0zRZ5kh06NLhWN7tcek3+4HNWxtv+gWx1fQyLDev1pXsKA1
         1OR5QzWapohKnofxV61uP6uy4pQOwUtPBJ49oAaPOm7KsgaoP9sFy6AcWSnbHmtl55ae
         bUwWIZncDLv4kBVbqfyVc+LuMY1kASgzMi3X97yM+8IcKTs9UTwI5QhoeD9ghaEBJsMM
         8lCNAOEkZWJiG7n1CCux9GerTvIaKigMsLKaxiWti75osihE6PJIK/+M25PsCkexTw/f
         7u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503301; x=1695108101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2r0YpULLY6K+PxoHfEEwV/ucVHBZJ+Dpxajz81fyHs=;
        b=uuZldJMmP1ifIaaNObYFFmqi71/uqF521td6a91qDtro+5UB8wVFZpPp3LVfX6/BiT
         ksVUL2D+iM91JIEEE/IQXe2A+up6/OPL1/2XSTymWTxzYc7atf3nVIX9MhAEcqNFdcV0
         ve+yf3fc1pIjf/jMxkHZx1sHH63fIUnyfj321N0E2T9SUxzmHTqi/VugWtUtkgxOtm/6
         I1i2+9quCotIlp0sLExGAy1mfOGKW+wyd111lD+/9Lw1YcxmrAmTL0OYpPuAVZf7OODS
         +5UN/Q/j4fefeFqIRw5loIn9T8OFIL1Tg++Mup2LBMMq7R0wI4cYDNZBjxzTklLBV5pd
         oSqg==
X-Gm-Message-State: AOJu0Yxv4b5K+549B2Wysx1PmNAEsp5rdgRYs9OfDXfYGggkcRCxyNWW
	fYc0E489eNqrSMiEd2Wxf/iVRnYglzaFB1YOyjylWQ==
X-Google-Smtp-Source: AGHT+IGg2CzEWP667Qqfts/ono6Td0uu2ls6pFuWNKcBbheeGuby4e11KXIChG8MZ1ozsgyPMRvu62/lvBUhMk9vKbU=
X-Received: by 2002:a25:42d7:0:b0:d3b:b36f:37b1 with SMTP id
 p206-20020a2542d7000000b00d3bb36f37b1mr10652029yba.33.1694503301543; Tue, 12
 Sep 2023 00:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230830200437.715735-1-robh@kernel.org>
In-Reply-To: <20230830200437.715735-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 09:21:30 +0200
Message-ID: <CACRpkdbEcejuN64+y+s0B=jpPcHwG+0Q8ufE+0ytxqUT=3976A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm,integrator-ap: Fix PCI node name
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lin Yujun <linyujun809@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 10:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> PCI bus nodes should be named "pci":
>
> arch/arm/boot/dts/arm/integratorap.dts:161.22-206.4: Warning (pci_bridge)=
: /pciv3@62000000: node name is not "pci" or "pcie"
>
> Signed-off-by: Rob Herring <robh@kernel.org>

This was fixed during the merge window by Lin Yujun.
Thanks anyway!

Yours,
Linus Walleij
