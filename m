Return-Path: <SRS0=j3iR=LD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A101AC48BCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jun 2021 13:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E83061182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jun 2021 13:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E83061182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amDm6mJxgONgxBExRpVnI0vxuhhhk7ryl/FvBIFImkc=; b=ggHhd/YFFFkbw6
	OhzLxcRF5WHLZ7piP6dm7w3SQjV2n/YYWdrWmGX2hkILgJZonaXHnrkhVmgBwbKcvPrAmqicbJWIF
	4EsBwhjtqfGZi4Wq0Bq/1JzXprBzVw5bMNHsBGQvaTKW2J63r9OkpJ4sTEh0yxjQnl1OnLsPs1JLY
	ZqGnZ+zeU0jnHUexgdgcLpzM6DPgmuCZwiz8YVbd/hTkXCmVGw+5GtASGONZLUSdoVQu61aQ/12TS
	AWSPbiEobjL4gnrdIxZZrJF+5RLxJSX5z36EQ8iEaJPRlzMD76S1h8ryQ9AkedSfNgwfRCz8zV/41
	HhvZ02oF0qvc/71qjuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqyah-00E6jE-Tk; Wed, 09 Jun 2021 13:49:56 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqy8e-00Dy8T-KP
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Jun 2021 13:20:58 +0000
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqy8b-0006ff-Pu
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Jun 2021 13:20:53 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so2556795wmj.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/jeQfD/PRU7+ZLKVWo4kW6eSKyG/9GBLEURDHxDyzY=;
 b=kw8BHjpsOJ5a0csGfif4+3pzVwIhPg82ZBB74N7YLGdmvEgqmRmUu4nzoXR+4QLd1P
 QZpMrZmYvyysJJvW/t70qmAwaWB1TAzQX80stWdpchiQlrN3QHAMgywiwK9bph6HidqI
 eyOjsJMXz8IgU2lnrm7tRlKbWaZ/hgwr8AUOcYf1XTw8K8gHIwX349kFvN7c/2YFG4OT
 tvYN/NW5SMiu84WiiVPQfRJEXrXO4LPtPIsd8Q/hpT7CH1c66GQTKO2dXAmKGnkyovNS
 e7U0mLyJMNYxjXoQHSOofRdFiz/IWqw/FuP2lo+fnpW+TctsXMxDbGdiQRG8hq+HuPCl
 YhGw==
X-Gm-Message-State: AOAM532c+SOwzCOvaMl8LA3UUEgXhYrO3U8g6ivdHP7IOJxIaOpvZCvT
 q90Ojk4b25486IwI6ZP+FKTSmCGR3fKLThdLKRVJEafKdv5OXRk/XQ9SAub6ZAHYKryjOXdIp4n
 o6eId3VR57CBFZVTxu+BWzR5WnCTp0oTjqozeo6kI+0q58PgzOfH7
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr28431603wrn.16.1623244853594; 
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPwIER/U8HjPgFdgQi+5438sNuC/K4BzQ7DUDd3BFdNyrQXv/3PhyC1zXgJG2F7mvCt819Hw==
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr28431577wrn.16.1623244853437; 
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id v15sm2086058wrw.24.2021.06.09.06.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <184b726d-fa8a-d708-df95-a0a7d1fcc58f@canonical.com>
Date: Wed, 9 Jun 2021 15:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_062056_732216_7DF00A03 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210609132052.IEO2Wb3NsZb5Vg83ozLw1DH-ifrG0FiG78wEBid9lKU@z>

On 07/06/2021 10:49, Krzysztof Kozlowski wrote:
> Hi Olof and Arnd,
> 
> Tegra memory controller driver changes with necessary dependency from Thierry
> (which you will also get from him):
> 1. Dmitry's power domain work on Tegra MC drivers,
> 2. Necessary clock and regulator dependencies for Dmitry's work.
> 

Hi Olof and Arnd,

Just FYI, the stable tag from Thierry which I pulled here (and you will
get from him as well) might cause COMPILE_TEST failures on specific
configurations. Regular defconfigs and allyes/allmod should not be affected.

I am giving heads up in case this lands in Linus later...

There will be two fixes for this, sent already by Thierry:
https://lore.kernel.org/lkml/20210609112806.3565057-1-thierry.reding@gmail.com/

1. reset controller stubs: going via reset tree,
2. reserved memory section: probably going via my tree later.


Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
