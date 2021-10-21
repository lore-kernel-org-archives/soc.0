Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1955FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 12:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C954360F59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 12:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C954360F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uWevu2aReiveTEKh/YW7ZaR9TCDhB3ky7ytEBk5gHtE=; b=LQNUOjppHGI0a36rkcd9igdU1j
	aCFL3wejKNe2V3QVk7pSAN88ebi43E/DWumwKBvew1rzGE3+G//WRF30Mmri7XlZ6cboqJbyvH4jb
	mnUK5PyeAKwgoxXcjpbWfzZ3VHEGjDmW9M11QH2KzNpfGPEglZg4usjmJonnQmbl6nCB/SHGZ8NYm
	vTslcqr09g0XxLYbfsfGONh9jYiTlmebWrekLxCtZPEvF69vCyPYW13nth/ExkqKpj0cWYbofQWVD
	AZnUSq7++96WiESFNl6/E7r9Yt6Gjmb+HHmH2I4brPWhoeP7dmIQXnlfVfqI4dHWLUCpRjUyzBqcx
	E1Gv0vvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdX8h-007TLf-3b; Thu, 21 Oct 2021 12:25:43 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdX8a-007TIe-5X
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 12:25:37 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F2BDD40004
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 12:25:32 +0000 (UTC)
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
Received: by mail-lf1-f71.google.com with SMTP id
 u17-20020a05651206d100b003fd714d9a38so221294lff.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 05:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OEvgfMSIzLFlHfTd+aj6jAI5gittIjBiCSXpIdeWxOQ=;
 b=gFb9HkpnOQ3Li+0S10co//bw7LLy1pFXAEmZ4pT/rIiYpt0PsG0tShIUuVP6ksgBma
 9eYMGxREz4PTKU5Vnn9qqScbz2O7zhNzvf5UiZ6EDtjRp8IsGZuNrGzbSgRn0W3NEszB
 4mmYzbJbg6uuLdcerSPkcw0/1f1CXvYe9Cu6g/Qt92CP7T+p/t2d2w84XVIB7K0qPi9C
 4cf0rDqnEzBWmfE5cOuuXAp9a5+kgF6uUaJMP5+NeUNugaIVKf64yFP8rwlIuK1fG0cJ
 vrhe+LvmkZisRf3RfMsrwE7nGLgtZVYOqYaPtzo3suYQmWbKiBRIC+DPw/motNgmzyNp
 nKVw==
X-Gm-Message-State: AOAM5320f5kmHcKBKgASVMwJ6jbMiyFnZxkO6Yw78/isl8EFn2ECFYFH
 jse0zQC6V8RwUN9t1wWeJvM1Q3nciSN9A8DqwBtO/3j+nTvqoVkmTVporvlC5uO3JAnWdXSs+yw
 k23RpEeElajImKu+DKvMC9SsqtgiwZf8R0vdCk3gPRLAQMt+jdJmr
X-Received: by 2002:a05:651c:230e:: with SMTP id
 bi14mr5404529ljb.467.1634819132389; 
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
X-CRM114-CacheID: sfid-20211021_052536_477725_34116D19 
X-CRM114-Status: GOOD (  19.54  )
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
Message-ID: <20211021122530.cCVb8slgvouN_roKG6lCz3AMGZGIrbPMgFuaYvBms3k@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
