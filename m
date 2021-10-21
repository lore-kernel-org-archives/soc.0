Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87568C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 12:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CBA7611CE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 12:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CBA7611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5fYrQUgaqK8LlcM8hRDBD2i7BXimHK60QQy83HPDtXk=; b=tKPM6RZ261jbVRUfv9PMcP5F5k
	dsxOJkQeQwP6Aie8lL/Yg1rH+V99gGQGbg/vJ9dNM/kUN0sK/0PsJBUOvIK05pKM+Z6L53pm54PFx
	8XfoOGvdoSIFYIyW9FkjtJXSnNuE+xmBVe6uI/vb54+GpXUflWo902LvmIj7/WQfgQ0NvPHXSBzVB
	RcPfzJ0vmg6ObT+0/EKaaNGpFxr+iNJzLAXjx7MmXvqie0WhOOT3v+9/IqKN01pBbBs2GSTn4qAYg
	m2JPRbwDfTu/VFaGtEjI3DGEBYH4uQmo1b+bI8YRSxzhzQ0IFzoj42Ry7oxfjAM/2C4QPKrdRdTK2
	fqPKnqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdX8c-007TKW-Ss; Thu, 21 Oct 2021 12:25:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdX8a-007TIf-5S
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 12:25:37 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7AA37402E7
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634819133;
 bh=OEvgfMSIzLFlHfTd+aj6jAI5gittIjBiCSXpIdeWxOQ=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=QdcMk4Jj1Cp/tQU67s3GhkmBC1/xhsmui+sH8BAezONB8rB2lfhIdEfqspxEQhirS
 sqoD7o/X7WDgMamjKO9WrrBhUCwIlDPKZiSqMEyYpdpjf3RrquP+dAJzNGseSMLFC/
 CDw13dFbHT9K/FpGrtMItVAfX6XPWwT6QQgyo5nLu/z2J/lYc2gF9cljWmPEZLzsYq
 p1Yh/x0cUzx3w06y1hhWCjM+hA9LZ1+e1aJ2OrXO1j8eDLbmuoK/fTMwnQZKbc9TnV
 zFFF1LoJLeBQ+QDXInXb8jhiZrQxxVZWfW1s1+dzjW9bETkih7TI0oy4FreQc5L/Ki
 Sbkx3qvw56Y/w==
Received: by mail-lf1-f69.google.com with SMTP id
 i6-20020a056512318600b003fd8c8c2677so233065lfe.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 05:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OEvgfMSIzLFlHfTd+aj6jAI5gittIjBiCSXpIdeWxOQ=;
 b=Y7YVXSBkYYNIGbsdWlcpbrALrm14YUqENdkjjipfCdRnRjO/Tk/HVto+furjdY5Caq
 cNmVgY5a6M4q3LhvTbaa5mMJ7Rcu4jA6mtC6qLmpoFXvgjZBEI2XPsgtrNIzW0aWZOH/
 VAFOroz7UFWNKF8+0hlpXg0itO7g9N5K3nPWCVc5OE5UOUIBF2zHNtsTVcr8/bYx3zRW
 ZmrGUM89Azr72tsRO6Ux6mhzhETeCSCqklne12SoNaI/Q4tx3SbaWX+diEnDFYzaV4pX
 KiY0y7WN29F47Plp7GqExf2i9kCTo2sXm+69VVml4vlD2yXXa6X4nu3JRVWiNHS55tXw
 rMAg==
X-Gm-Message-State: AOAM5318SE/MTqf1AxWtmkiDw0gm6vqnVr9x+m3ErULbnINXEPYBWj/z
 4kJLVA1RI/b5DANanBd1fQcyLY3Lw+FXwH4G4j374O2UwnNWzVfImWcBBTm6Wl6hYEYJqlDEy+b
 7wjtU8MHOppVuQB5wMJuPu2gVrNxkqBXP2ygg3t7zqHnZsw==
X-Received: by 2002:a05:651c:230e:: with SMTP id
 bi14mr5404542ljb.467.1634819132524; 
 Thu, 21 Oct 2021 05:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0/8NcGHTrSWS0H6+LXQbRBX3Abg2xVQ13rASma1FIwjNQK3yxWARDRCPBIvJmD3bqslQp8Q==
X-Received: by 2002:a05:651c:230e:: with SMTP id
 bi14mr5404491ljb.467.1634819132086; 
 Thu, 21 Oct 2021 05:25:32 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id o15sm537797ljm.139.2021.10.21.05.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 05:25:31 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4f9141f6-a35f-e412-7a9e-a00a7c8376b2@canonical.com>
Date: Thu, 21 Oct 2021 14:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_052536_473123_4807E37F 
X-CRM114-Status: GOOD (  17.99  )
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
Message-ID: <20211021122530.WEYdczxdu1BKeqY76dTkOJTsRkFM7-iXrt8cRI0WQIg@z>

On 21/10/2021 14:23, Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>> unfortunately Palmer (RISC-V maintainer) did not respond here.
>>
>> The usual RISC-V patches go via Palmer to Linus and I am not planning to change
>> that, but I want to get these fixed.
>>
>> Could you grab these to soc tree?
> 
> Sure, I can add them to a separate branch in the soc tree, in case the
> riscv maintainers
> take them after all. I notice that you have only Cc'd Palmer, but not
> the other two
> maintainers or the RISC-V mainling list. Adding them here to maybe get their
> attention.

Yes, my bad. Thanks for cc-ing them.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
