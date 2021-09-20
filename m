Return-Path: <SRS0=0B9I=OK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E814DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 10:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B404C60ED8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 10:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B404C60ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d6bYC2o6b/DBy7ObXBt5HbQYHxKugOKHZsni2AhUO+E=; b=zg7tqCGYzQJZCc5Fi1VsA6+H8T
	DLdqHfbjqQSB61Kum6Q6nAbdKPsETV98kPOEoahRdrJ9Y9VGUC1iimSO6YcGMMLFzFLBZGyg/vwMw
	mFW1h76whQ6yhb4ddkxxVGq+12ahOVgsnJv1/qWWKZH9sN0ZB6+CquOzq8omjQDxExWNx3PngTqHj
	hdT0gOU8csCeFOUwmbyaqiKRpSHHynX2aqtmUul83wLoYegjvFm54Vr5lzO+VvOXYDH4t3EuYP7Bt
	JLhPxxHJEQfcIfkc3hFvQYhL3Z79pL9gIdXdFOOVgV+kRNGlHy0DifvQ4S6IQkKelxIU0wbht86N/
	/qy/Z4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSGXq-001Hsa-2d; Mon, 20 Sep 2021 10:29:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSGXm-001Hrf-4j
 for linux-arm-kernel@lists.infradead.org; Mon, 20 Sep 2021 10:29:03 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C9D73FE05
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 20 Sep 2021 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632133733;
 bh=h1YWBhjma4M2GwmIPdG3QPXZrXZU7YAH22dk5VSYmW0=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=ilTwwVhcb7Nf6Kp7s4B+meoifEtgKXOZPE1sVizqUBM0WxzseF14SGKkqqIz4twTr
 EgLj1sqa9gTr2Z7rtCtBC7ILXZAXSxD2gOIxT0xXJ0IXG/JL+ATjwsLst9DrePMJob
 IYHBo5vJuEYJBO9MfTo2+xyt3K+abjUHamSk59xYF9umpv3cGm0gq0+A41Qy90X4rV
 Td3Mw4Oh6HP03NFx9RkvvKH+pRlLHurr2T66Emsxo7Dr6QCkwS0eRtL3yPqozBuOQa
 LOhfEaTsWVgucdJGdN0o0/PvIGMt7Yl3CUhHeiRG8gPE9czJ8jAD3k6ERnWijJEPQy
 S63b5XyprKFZg==
Received: by mail-wr1-f71.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so5686504wrn.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 20 Sep 2021 03:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h1YWBhjma4M2GwmIPdG3QPXZrXZU7YAH22dk5VSYmW0=;
 b=yEvnQ/x6weOYKeNRCR2wn1RNmtWO1xzcvOgOXJIv5Lj5hnA10RWYG7NVrGYmudu+GU
 tJpyoMusdqAloVaG+w9wnvMjbcPPudFmhNNLShclElrSUoGKGiOgFnfWsGRsbqlziS+5
 g33b6lXrycXQsDU1o7oc7tme48mV3dwsLrgNxppR+kn7OmVHPPGNYzNm1Fg+e2t80Nrk
 z3/fzCckR8odXS+IOqVtTnmJRpFnqvtGjLZwlVZKKRjKT0fwymEl+Xlj8mx7PGK8PV+q
 2E65hDepyj2q5gebb+I8bZN7UMx1Zq7eQPlbzN7tvhqPCC7qrFrGb5OUUnQFuo7s/kyU
 vXSA==
X-Gm-Message-State: AOAM531Y2fOYpgjrahjEwbeemFzlAZsh90PpKQ0C1JN4RrCsiye/wf7/
 zZc5Uy5ojTzaUCJKeqYtMrcN+jc6tIT+vhy/jcPfpItQAO//+W40p6bmApa4/rdlswTDlR9qgFf
 +vt+Q8YGl+2zpUyi09q1LJJ1g4kjWV1aKoGh4vyurnoLDOHAQUO6k
X-Received: by 2002:a7b:c947:: with SMTP id i7mr23403117wml.179.1632133733198; 
 Mon, 20 Sep 2021 03:28:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8roJ7mxUuaEl5Dmc1d3O4yyBSyyeQBPXjTbcVZynN4bU2hmO4ka5BX3dZbMKlKHujyenKwQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr23403105wml.179.1632133733070; 
 Mon, 20 Sep 2021 03:28:53 -0700 (PDT)
Received: from [192.168.2.20] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id c185sm14249104wma.8.2021.09.20.03.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 03:28:52 -0700 (PDT)
Subject: Re: [PATCH] soc: samsung: exynos-pmu: select CONFIG_MFD_CORE
To: Arnd Bergmann <arnd@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210920100613.1613919-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ec078007-4d70-aa24-3a18-5b1cfb9cba25@canonical.com>
Date: Mon, 20 Sep 2021 12:28:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920100613.1613919-1-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_032902_369513_64F900AF 
X-CRM114-Status: GOOD (  17.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210920102851.QJufAvUSHHjjK4Xkz4SqDrPIkZcyds2ql0MJpPV2SjI@z>

On 20/09/2021 12:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using devm_mfd_add_devices() fails if no driver selects the
> MFD core code:
> 
> aarch64-linux-ld: drivers/soc/samsung/exynos-pmu.o: in function `exynos_pmu_probe':
> exynos-pmu.c:(.text+0xa0): undefined reference to `devm_mfd_add_devices'
> 
> Add the missing select statement.
> 
> Fixes: 93618e344a5e ("soc: samsung: exynos-pmu: instantiate clkout driver as MFD")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/samsung/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Hi Arnd,

Thanks for the patch but this was already committed few days ago from
different author:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/drivers&id=e37ef6dcdb1f4738b01cec7fb7be46af07816af9


Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
