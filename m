Return-Path: <SRS0=4zcX=A5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023B1C77B7F
	for <soc@archiver.kernel.org>; Mon,  8 May 2023 14:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 858DFC433EF; Mon,  8 May 2023 14:50:35 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D67FAC433D2
	for <soc@kernel.org>; Mon,  8 May 2023 14:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D67FAC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-965cc5170bdso636822066b.2
        for <soc@kernel.org>; Mon, 08 May 2023 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683557431; x=1686149431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMmZCKvPSgtFZs9o13Tig/KfWa59Ms4zy6g+NjJ0joQ=;
        b=XjHfVTNS7RPgE5uMNqBQZYYU1GHP/gHYtMXKaN3iX9Wr5HwDo9N9A3ire6KDFgWwQx
         nlbUP6YRublx+RB4abMEZRBoYIte1TlgktsGloqxjFzctwAIo0jBLqcc+cGpEit5gmKc
         nTlteuP2thrdZKg4xeRcw7FsfOtz/L/5d66s6FZj7DNmu6ppfkG2gwoo0ZQz2cxnJmXF
         pL4qcygEEQGKMQiEQzJ8R9UV38DVSIKsBMOqWTzJNLl3/JtgiYFmdT6MIzoU97qG0MiX
         2+kzQOVLtcpDBdL9q64Ej8uPgan4p5jpX/m6T83XRFnKRZa+OYlNRrQIICAC+NLaiXds
         tMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683557431; x=1686149431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMmZCKvPSgtFZs9o13Tig/KfWa59Ms4zy6g+NjJ0joQ=;
        b=VQv/Ec8se0KVF+ldp0EOANF9XmtiMYPan87BYnoLYBILDmgUpAx4ify+qAx5v+ezHJ
         EDrmLNCa2qC/e9VJHI0UoOdz0IdobVEgNixhxCZFmczIHJ0oVl93wEFOa/nHtwcNMiOo
         9LSXytOJ+tH09bfGOD64vGqcJGTQ2Cr2SgpxuayXmmP1EiYZWz+Lwni+/BCdb4oMNRr+
         S5F+KUCdQihAkIL28aQFcFrJBpmcf31Jm4V4ygRdsW9p65kT+cRXClNmAXLQMrX7cXaq
         cm/PkKj7nqxgx2pqtpZiEeU5DXVUJwxP0xBamxz2GgGgddlRMhyOkQuQzKrJtZRE02nV
         aSwg==
X-Gm-Message-State: AC+VfDx0WCxzK/+iDzmtazxGenKtSy0PBh014l6FotPFI/2qY+kpqqAE
	s1v2Lm8v5Arif6W4RRPjEq6JmQ==
X-Google-Smtp-Source: ACHHUZ5SG0QojaChuSrchOK7fGRM4vlmbcHOXVXAIXai8UkeYvgifoSmigtg9gE8tLFTKRugSiG76g==
X-Received: by 2002:a17:907:3faa:b0:966:17b2:5b15 with SMTP id hr42-20020a1709073faa00b0096617b25b15mr7285332ejc.7.1683557431048;
        Mon, 08 May 2023 07:50:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id rq12-20020a17090788cc00b0094f0f0de1bcsm46430ejc.200.2023.05.08.07.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 07:50:30 -0700 (PDT)
Message-ID: <9e637c7e-c7b5-6eb6-c3e0-c7842d2756ac@linaro.org>
Date: Mon, 8 May 2023 16:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] ARM: dts: Add .dts files missing from the build
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Masahiro Yamada
 <masahiroy@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley <joel@jms.id.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Lars Persson <lars.persson@axis.com>, Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Daniel Palmer <daniel@thingy.jp>,
 Romain Perier <romain.perier@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>,
 Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-2-2c8e51a2b6c4@kernel.org>
 <CACRpkdbfKdR=ru8dCJL0Tincu2-Smsi56vt=C7OW3K9JuQ=47Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbfKdR=ru8dCJL0Tincu2-Smsi56vt=C7OW3K9JuQ=47Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2023 16:48, Linus Walleij wrote:
> On Fri, May 5, 2023 at 5:29 AM Rob Herring <robh@kernel.org> wrote:
> 
>> Comparing .dts files to built .dtb files yielded a few .dts files which
>> are never built. Add them to the build.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Wow weird.

I wonder now whether there are such *.c files as well...

Best regards,
Krzysztof

