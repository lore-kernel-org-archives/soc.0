Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C9DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 08:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2679F60EB8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 08:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2679F60EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3HvQ2QbQ10ewLjW0/D83LcbpRna6r0Sv1hBgRVEztmA=; b=eFUjJrVx76uWfvm/POQn1+msdb
	87oiZa6TloTuxp3BywYHl9PvV95ldcR7io6kbOvw9JkiZpUtj1cGeVhC1wIvrqIMrvO2/yjGnl55W
	xIXNiXfdptTTHLzkh2yg0i+KhHT6Rh+wi8PjzaIeu57vU6Muz5xF+cfLnL1I7yWaGMSchRRXVVDqE
	ZA3Ox8XmVQfAYc9yI/YN+0zJjlEAkHJ5FK0+oADLsNHE0OgrQ/URQ7Fb0Dhv/0KYgy3UX4qJNKtIT
	OQG+YF+pfNJRApdU8qYit2d4CBkOQ3eMC8u258o89nRIgps7pqQePN4bEoxloVnDApX1YOPHm0T+P
	QjefrUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqLL-00AGbC-W3; Fri, 22 Oct 2021 08:56:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqL4-00AGVd-7u
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 08:55:47 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 66F793FFF8
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634892944;
 bh=Ti/kWwWZCiPv4gL/LdQf6/gYsg4XXLTy9z9bRwDkCkI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=Ud51/VuF9FIiD5QY85htXxUaQGKCM3qfBudQ67SsLhtcSyM4xF867DGSnaGwX4JdX
 1qn3VB+duEjAZiaavuL7luAcJa5rI3VQrv63Rphg5H7zoGENPqxe7l/hmcZjrqBNP2
 L+evpbUrA5sewuezcfylXtTO9/3dFCCPv936Bkcus9TpTtD/U6Zwgtkc89xHWCreAt
 N0ew9QtA4OlgVFR1ayxNIRzPk2r58FMA/VdLFlwEVnpI9p9CAE7/fCK2fSGx6yBBiM
 drVY+mygWbSAxbwB35xw5izW/JB8BBtaJyWyWNF8WyM0VBG+jZwj/r/CrPdMEcU4Yt
 WJQdFjFAYyGLA==
Received: by mail-lf1-f69.google.com with SMTP id
 y40-20020a0565123f2800b003fded085638so1471972lfa.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 01:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ti/kWwWZCiPv4gL/LdQf6/gYsg4XXLTy9z9bRwDkCkI=;
 b=WaPo+zWmU3YX14grEHBcBRe9V7SVqCgJefYO9xSmSzaOuGq0w+gWCXEbXnDq04S1jj
 b9JYDypsvKdCXB84g8pMt567Ib97M4/Pgm1CaYy8AIC1cZiChQqi61FaXN1rX6+T+WFG
 FSAan/ZFlXDnhcyxGI2LuTwSpdavqMeszsRGf/GD7FOn3oI7ZDb9ZQU9OWy0SEagRTTd
 BEt0mKVKjchCb312X7VW3TD9nhOGTCp+xd+vgIbb5gDCb3KjvzwpzG68pKmRqD/7cq6p
 q3NBZltf8GXGilaYI7pdVpgu2giEJWun/KO8N+N7g8YgXhldX5Z4pqdbvHgSAV/ePnW7
 Gizw==
X-Gm-Message-State: AOAM5336WKqN7c3T6/BlagsPYDQiRh9xtbmBkQOt1MNIrWMZ8dyq/j3b
 TU8iBTfbGyaWdu9zs9uQcTq78gOEjJyhRP5x6U4jm7xOzmEHOD3vVvj6Pk7VhXPtGrI5VEbUzMo
 06C18d3A7gPheW8Or36aq5mx2Q4TSj0wbQsP/+0mZQtqiVA==
X-Received: by 2002:a19:fc01:: with SMTP id a1mr10557860lfi.214.1634892943599; 
 Fri, 22 Oct 2021 01:55:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym9KlsLquE+h9zu7V/QcUc3Crv0sHVj601Gyg6l+LuiW0HZGNuwzkArQkA5Em8fi4+NvG4SA==
X-Received: by 2002:a19:fc01:: with SMTP id a1mr10557848lfi.214.1634892943456; 
 Fri, 22 Oct 2021 01:55:43 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id x4sm674150lfq.246.2021.10.22.01.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 01:55:43 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Conor.Dooley@microchip.com, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
References: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <accf35b6-2c13-227b-c101-a36cdcd5e73d@canonical.com>
Date: Fri, 22 Oct 2021 10:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_015546_452161_F29FFC4F 
X-CRM114-Status: GOOD (  14.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211022085542.kM7Jhxznrgmg8-SHAt0E8azLCmbUNJ8O6jwj19IHH5A@z>

On 21/10/2021 17:35, Palmer Dabbelt wrote:
> On Thu, 21 Oct 2021 08:18:16 PDT (-0700), Arnd Bergmann wrote:
>> On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
>>>>
>>>> There is only one Microchip patch here (plic/clint). Others are for
>>>> SiFive. All the patches are described in the pull reqeust:
>>>> https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
>>>>
>>>> I had also second set of RISC-V patches for Microchip. These were picked
>>>> up by Palmer:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>>>
>>> Sorry I missed this.  If you guys took this through the SOC tree that's
>>> fine, otherwise LMK and I'll put it in the RISC-V tree.
>>
>> I haven't merged it yet, please add it to your tree then.
> 
> OK, it's in.  Sorry for missing this, IRC is always a good bet for these 
> sorts of things as my inbox can get pretty hosed.

Great, thanks!

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
