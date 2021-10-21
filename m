Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0585C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 13:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD9D611CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 13:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BD9D611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9/8zX9SSKlU5IK1VrgNnlFjN4iHAIZ4HPJp3i0wYn08=; b=IFeDWZB+jzS7RuL9ACbC7TkiP0
	lQHp6E0manr9IefDugo3uiuSNrVDduwHkoD2Q8ytXVXp0wAbuAoGa4DsA17oJhNUz4FC27DRj6pUn
	5EvI8rCTUooMlWc+/RBA3n9jKBcdJQIqdBTKtR/hFTPNdRpogAhscVIPdk2dqn4DkgLFbeNdUo6Hd
	n8Js0fCKFrDdY1Dcf5Kf/zUGEdthTSuLVmeVjFXZ2twd8Rmox6gPgUXaxialcfLDJ+bMTdz0k+48N
	Uk8Unl/caIfTlRxjOIygV3LPMZHYSS0rf+bNupwgxchkhJ2292PfoTANTn+IfepEWfRD5hVf6yUDD
	WJjTkxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXpW-007bem-RY; Thu, 21 Oct 2021 13:09:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXpS-007bda-If
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 13:09:56 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B22A140751
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634821792;
 bh=LsLSwWX/aooK7LR05wvQfGIlyo9Xtj71zHzTzlar0ms=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=riCC7N2MSJijx1PIF6W6itwzUVeQ0MgjKrWvDl085SnwFcTEuzkt2nKmduvMqcmNi
 Cexiza3MFRCWBwtU8cptvoJzCzlK7Tw4ckJkfzyhQF6MxiEPuwT8racj37NDgmUKDW
 ZCwByheydvb5J1FHFGhNgn3lsZg6Mj0j3cJJdN8sMoZiIUJYA8TpRN2gLPmjZ9aX4H
 qaA3BF7xrpgQPxr3KsP5viUYpMv0jxpZd7dZ9o2oXIduhzAg+l7vkWrAE2kw6eGbsF
 zQMpO4nQQGMsRetmGScETJZuQq4raroAd5rz4i0ESu9XYeMlpiYjhpM0Sy/vUdsM96
 Vxc7Srfo8o9sQ==
Received: by mail-lf1-f70.google.com with SMTP id
 k18-20020a05651210d200b003fd86616d39so340983lfg.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 06:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LsLSwWX/aooK7LR05wvQfGIlyo9Xtj71zHzTzlar0ms=;
 b=zXb3bk7szyWAKP8ZdkVtK58W90N5a/730E17Rkbnaivd7B4dHvIYXv3xdHOoq5hdbR
 p8gvoFh3R/jg+XrKZnPIZyYmtSRbKZDdzITmRTEavd5SWqsWxQGri2TYiJp0i9KAuHTV
 /InKoz7lmsJZVEUhzNl0L9L4a5j5R0UeKa2b89BlwdM+4U5f2qoAkaZO3IPhaYGS2Cwp
 wl1HecZhPEj8SlhwkN38rlCtX3HBY90qPsHBruu7qk0VX1+W1/x3IxWYl37dV8Is4T/n
 i8eSQnoGddol9BS1hUKBSOns0uImnJ0lWKDZsy52CGt467qP+08Bj3rXMlkCWWlTVujH
 sXUw==
X-Gm-Message-State: AOAM531sGMu9jGqHjYkaKPaYxnLgfTDdxrjaOhlJNPg1ES9TYqb6BiAl
 IoJdsYuqm3lih/OoTW5juvVjMAfNtGEZQEkk6nWv6lzExz5iFfqBs+WsH+BEDNhIMZhNUIVvaVy
 lt9X+u5XAwBckGij91RHT/GxbtiL/Hn5JmLgLqzH1XsN4JienWqT5
X-Received: by 2002:a05:6512:20ce:: with SMTP id
 u14mr5618476lfr.548.1634821791885; 
 Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Q8yU5QzJPLw3kvAdO+Jn8XVXoKvjIRiitatn+3XEGA9u7UY2LAfxyxt0u2Zf+taROiCpGQ==
X-Received: by 2002:a05:6512:20ce:: with SMTP id
 u14mr5618453lfr.548.1634821791675; 
 Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id r10sm539546ljp.56.2021.10.21.06.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Conor.Dooley@microchip.com, arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: olof@lixom.net, arm@kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, palmerdabbelt@google.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
 <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com>
Date: Thu, 21 Oct 2021 15:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_060954_882179_2CA67D6B 
X-CRM114-Status: GOOD (  17.69  )
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
Message-ID: <20211021130950._ZuswP-qa33IMF8dbAxq5QVglTfrRMGk-fsLgM6E3CE@z>

On 21/10/2021 15:06, Conor.Dooley@microchip.com wrote:
> On 21/10/2021 13:23, Arnd Bergmann wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> Hi Arnd and Olof,
>>>
>>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>>> unfortunately Palmer (RISC-V maintainer) did not respond here.
> 
> Out of curiosity which series is this one? Is it the one with the 
> plic/clint changes?
> Pretty sure that I have taken them in internally, but I am going to 
> submit a bunch
> of changes to our device tree soon (tm) and want to make sure I have the 
> right
> dependent series listed.
> 

There is only one Microchip patch here (plic/clint). Others are for
SiFive. All the patches are described in the pull reqeust:
https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/

I had also second set of RISC-V patches for Microchip. These were picked
up by Palmer:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next


Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
