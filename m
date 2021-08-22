Return-Path: <SRS0=hiSs=NN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C18FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F09E061206
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F09E061206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTWovVbnsDrmFFOPdlfvcoh5AP7o1qdbBZxRei5X3bA=; b=gmXCAzZm6yAGA/
	mfNYAwkTm67IAlpzbJivISm2ezkAjOcMrC8ZmycW8N9JBMiY7c2K04U7LT3pbtjf9piLHJdmqA2q4
	7a5PGQt4ZD/Uzxy6jlXs6OYuu8KAdd1zNSXS9J4Z2WV+pbrPK+q7AiBC/x+YzgOvCdU8tFA1rb5gl
	y48wdvoc8k1hB/DngwfX63AfIJ3SvCiSXZ0WnR4rSJ59Nl9yIZlk9sf1sSJo6lmgoCP0OtIKbMe36
	BxCZuJ8gnIBhxn42a+Wluks2gHdTkeQuvkDPXJEjt1h4VRasFxukIaUv8QmNjBVlwIhtsUXbkth05
	rbeM5PF0Q0qx8hBENZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHstH-00EaN8-0b; Sun, 22 Aug 2021 19:12:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHstB-00EaLO-85
 for linux-arm-kernel@lists.infradead.org; Sun, 22 Aug 2021 19:12:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id f1so2037635plg.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 22 Aug 2021 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HqLZmepQrKc9lx/z79M6Ifhxm7Ymq86aEQN8GvgSv6g=;
 b=X3yQc6GnrI6r7AnR/mfCNcjXqy+BU5BYcuUxpvM58lspw5iipOWSTgIh5brI8lsusH
 /xauYGJn9piNjwYgmoa7SL/ztltx+XKI3bi8GIvl0+3ASaVjkB0Tm06Wjox0Dm/fBpC9
 0uqRHJJwZ2ShJNrR4ERs1kwVdN1jzj/4zie3gpZl6IaIgIne/JYBD/fC7jgnsAb95Fn6
 kUjs+c7clZUCXYMtsQeZTDGR7y7Ypr7PemHP3hmp1d8VKVOQ5y8HutalhtbuYUOL1x+W
 sZC+p15f4CloQ4U7R3j2NKKv/5j5PZI7XiWNrckDp86waAlBCYclCxOzIuXfcFPG5jOG
 HpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HqLZmepQrKc9lx/z79M6Ifhxm7Ymq86aEQN8GvgSv6g=;
 b=pymppw/Kc/+IXroLU4ZyP65ds93QoA8TcOezOICyDzoDnyDH5NjVAqixGrKgqzQTlY
 oafiYx0qN31TFYLbY6XQJ0fJcd7ORU0Gsd5PBcjS2yVrp3qTdhYetnngesWQ+I6sxOVg
 Rio06rMDnLiIMZ/GDLoCBGs0xVsGgTfxZ0a7c038hPKgRDHnCiAVHumKWZ/CnONwWGYJ
 JcFXrgc3RYLgf7755AfAAa4x+KWExYMOuI6X1XfmD5Hgcd6A6jRD679XrHPqcAdwgnOE
 KgQTtmlfOGd4IDS3M9SG5vdxT9D3HBccBZH1yhZskYkrXIWm04FTm3Z0r1kQkRnm56Jv
 jkUA==
X-Gm-Message-State: AOAM531kUDWCFLNN4u61h+VZPkGdzwVrKoA+h4a93QSS8OSgNnsEKK7X
 4fu1i5LaulO4vYgZn0kLf7Q=
X-Google-Smtp-Source: ABdhPJwD6IqDxQ/V4tvshJc+8M1kmIbPfg9RNGWammXPYoviFSDArmXwwDAOrgxg30KkyhWwRgWZag==
X-Received: by 2002:a17:902:aa06:b0:12f:66dc:be7f with SMTP id
 be6-20020a170902aa0600b0012f66dcbe7fmr6831383plb.9.1629659532350; 
 Sun, 22 Aug 2021 12:12:12 -0700 (PDT)
Received: from [10.230.31.46] ([192.19.223.252])
 by smtp.gmail.com with UTF8SMTPSA id u25sm13115374pfn.209.2021.08.22.12.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 12:12:11 -0700 (PDT)
Message-ID: <f8510e24-3f1d-47e2-3981-7415f0926a1d@gmail.com>
Date: Sun, 22 Aug 2021 21:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v5 0/5] ARM: dts: NSP: add Meraki MX64/MX65 series
Content-Language: en-US
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_121213_397745_79056208 
X-CRM114-Status: GOOD (  14.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210822191157.pVC3SK9g58F0tlB82DKNu_C3JMrIOCPGhoXIBuOZFPg@z>



On 8/6/2021 10:44 PM, Matthew Hagan wrote:
> Changes from v2:
>    - Introduce boards to Makefile in same patch as the board dts is added
>      (Vladimir Oltean)
>    - Use alphabetical ordering for labels (Vladimir Oltean)
>    - Remove address-cells and size-cells in qca8337 switch nodes (Vladimir
>      Oltean)
>    - Remove "cpu" labels from switch nodes' CPU ports (Vladimir Oltean)
>    - Various LED fixes, utilising dt-bindings/leds/common.h and correctly
>      specifying LEDs in the form "led-N" and with the color/function/
>      function-enumerator properties.
>    - Fix PWM LEDs and corresponding pinctrl bindings. (Vladimir Oltean)
> 
> The following changes were submitted as a separate series:
>    - Introduce patches to disable QSPI by default and enable where used
>      (Vladimir Oltean)
>    - Move mdio@18032000 node from board related file to SoC (Vladimir
>      Oltean)
>    - In addition to above, relocate mdio-mux to bcm-nsp.dtsi and fix
>      the resulting usb3_phy issues
> 
> Changes from v3:
>    - Sort labels on mx64 a0 dts files into alphabetical order as well
>    - move include directives for input/input.h and leds/common.h to
>      bcm958625-mx6x-common.dtsi
>    - Whitespace fixes in bcm958625-mx6x-common.dtsi
>    - rename "senao_nvram" partition to "nvram"
> 
> Changes from v4:
>    - Move chosen and memory nodes from bcm958625-mx6x-common.dtsi to
>      each .dts file (Arnd Bergmann).
>    - Append [@<unit-address>] to memory nodes.
>    - Create Ax stepping-specific dtsi for Ax devices (Arnd Bergmann).
>    - Append read-only property to at24 eeprom node.
>    - Remove L2 properties which should be defined at platform-level.
>    - Correct NAND node names.

I applied patch 1 first such that we don't get warnings when we apply 
patches from there on during bisection builds.
-- 
Florian

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
