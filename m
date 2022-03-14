Return-Path: <SRS0=DEnQ=TZ=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6451C433F5
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 03:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F8B3C340F4; Mon, 14 Mar 2022 03:49:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5FFAC340E9
	for <soc@kernel.org>; Mon, 14 Mar 2022 03:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5FFAC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id mm23-20020a17090b359700b001bfceefd8c6so9952430pjb.3
        for <soc@kernel.org>; Sun, 13 Mar 2022 20:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mrr28nJUCfgByHsWGp/lHeprSpd4BkVYd9lJAdXUu48=;
        b=FPB+lPM1wM0el3n1VYmlE5LDbRTs8sdcLP6rhLivQXbvVE/6OaSdvkuxVAWgW3GAS6
         mCMPT6yPPoLqUIWqzXKaXl49Jt30BLrmJOnguy7j+UnxbQTA0zSY4jNbIQh2b552WMCr
         BLspIouyPoT0BBBqWpQYuIb1WptiTqYoBJBCZtRSMdx6OIO33LoVdkbeOiVV2NUfmKcM
         rer+SutQKOCp+tKYwJ2sYviEeAxSgncvatqYsjAeLNOZsxgX3ubUvG6sbjPmA2rMvmLn
         RVlLSP1bvyDZLSkNDSC4so10uHrNNkh9L3S4BfBy8cytp3VvdbSBQIkc+FaPh13vvfRa
         R1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mrr28nJUCfgByHsWGp/lHeprSpd4BkVYd9lJAdXUu48=;
        b=a6+rndlbOI4wjMWfbXZR1jG350eLPMObcAXOHYJTH2DEgH477qeBsjzJElscVOQzvi
         2tDinJA56+k6tmUWHb6WkFmJZM10Lh8JHyMSdUTllbIrhPz7vzihuCHV+lmp05XuGqVo
         Q7ZWxCv+qwCFYOwDyyn7cneZIMRNzLifYsTSUm2y4/jUh6Q317cB3ATwXkPt6/6tdQ+Y
         0Sh7IVjqctvNeUIOriDdzfdNuLAYioWMGP/Rgc5Kbloy8m/ggaOJByT2AgnhbEqMTX45
         kiuDp//BWWfbJYa0mBJnpNhbELNpsmdfdhIRAtLexxXllG6GLMv3ZBo2uhLE4giiQc3S
         RuYA==
X-Gm-Message-State: AOAM533KMJSLwe+GpPcYIRVrYZGUPRQ2PN2kR4mBlg0js4pF0Wqnw8h3
	zJ8EVCJz5BnCdsTIo8+vRazNSQ==
X-Google-Smtp-Source: ABdhPJxrhB5eKmRl1RqT3UBbRYo79qSooHLNLaD7StOCwa5jF/tglcgSr1X0UJm/D49ONUYxaDhZEA==
X-Received: by 2002:a17:902:d486:b0:151:8e66:621c with SMTP id c6-20020a170902d48600b001518e66621cmr21648715plg.141.1647229783099;
        Sun, 13 Mar 2022 20:49:43 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a414c00b001bf6d88870csm15733286pjg.55.2022.03.13.20.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 20:49:42 -0700 (PDT)
Date: Mon, 14 Mar 2022 09:19:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Wunderlich <linux@fw-web.de>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>, Peter Geis <pgwipeout@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 3/6] ARM: dts: spear13xx: Fix sata node name
Message-ID: <20220314034940.rxkgue2kllnqhucp@vireshk-i7>
References: <20220311210357.222830-1-linux@fw-web.de>
 <20220311210357.222830-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311210357.222830-4-linux@fw-web.de>
User-Agent: NeoMutt/20180716-391-311a52

On 11-03-22, 22:03, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> After converting the binding to yaml the node name does
> not match the standard pattern, change it.
> 
> arch/arm/boot/dts/spear1340-evb.dt.yaml: ahci@b1000000:
> $nodename:0: 'ahci@b1000000' does not match '^sata(@.*)?$'
> 	From schema: Documentation/devicetree/bindings/ata/ahci-platform.yaml
> 
> Fixes: 07658d9a659b ("SPEAr13xx: Add dts and dtsi files")

I don't think this is correct. The above patch is correct. The first
patch in this series changes the names and that's where things break.

I think you could have added these patches before changing to yaml and
then nothing would ever have broken.

Since this isn't a big deal anyway, I think you can just drop the
Fixes tag here, and other dts patches you have.

-- 
viresh
