Return-Path: <SRS0=gdDO=72=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8578C761A6
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 18:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B4CAC433EF; Mon,  3 Apr 2023 18:01:13 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67CF2C433D2;
	Mon,  3 Apr 2023 18:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67CF2C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id w15-20020a056830410f00b006a386a0568dso800884ott.4;
        Mon, 03 Apr 2023 11:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+2HyVBZpgIAk4A8UQ7TPXHjOeuEm1wa0e7V0v5arzY=;
        b=Y36RcD8iRdfLQg7wgYZL7ukTHBLa/dIsilS7BAAnKq+tz7fjmnku7QRSKAvCtAOyTQ
         MCvXAifC4IuXFLQza5qzad98ZJu/9E7FKLq/QT6b0PV2Be7IARQky3+NuwldbQAdYHBQ
         ZXY/ARcGVxPDPaHED1esC6i6epkMul4tq7+xeEhC18btnErWcyrM+skBU+QwxELePVWe
         Fs8lC9mLpjkHJPt0wCKDUwqn+sLUYey6sQrJJio41J++vhlcbZxxPWN+cjDK6o3KW0Xu
         NDfVzexRe3x+EnO2lrEwfR1R2oUoeZkEQJZOHSJHTAidjhmjvsCoqSMNki7dzW0VKmNH
         TOaQ==
X-Gm-Message-State: AAQBX9dWFNSQdAcf+ULTJPXyYr3QO1i0GVLO023O6pzdeXeGB2sqWYyv
	PwZYw92mUsxrQi8PgFu7wg==
X-Google-Smtp-Source: AKy350YbposOHjUqSKPLp1r0c5pZmS2vrYBOO8PRSBJMRbIsZ8g5xLashYmoygD9IWOODdA8MPrzFQ==
X-Received: by 2002:a9d:63c5:0:b0:697:a381:a8f8 with SMTP id e5-20020a9d63c5000000b00697a381a8f8mr41722otl.3.1680544871315;
        Mon, 03 Apr 2023 11:01:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d11-20020a9d5e0b000000b006a3170fe3efsm2707835oti.27.2023.04.03.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:59:56 -0700 (PDT)
Received: (nullmailer pid 1164679 invoked by uid 1000);
	Mon, 03 Apr 2023 17:59:39 -0000
Date: Mon, 3 Apr 2023 12:59:39 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove obsolete
 bindings
Message-ID: <20230403175939.GA1162106-robh@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>

On Fri, Mar 31, 2023 at 10:34:44AM +0200, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,

I can't spell it either, but checkpatch tells me it is: maintenance

> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ----------------------
>  1 file changed, 28 deletions(-)

Always great to see fewer bindings. 

Rob
