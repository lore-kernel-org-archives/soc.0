Return-Path: <SRS0=AiQL=PK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F36FC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 08:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF5C603E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 08:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CF5C603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yP5nsS7Xl16jj4Jigs/CPacF1WYuTieHIqNPMlTk5zg=; b=4DxPNUhXqMIutzYCqLxtPPO7NK
	PCEQXMzruRB1ioZozrRVAo26x6LSvcBI38fg7CYQzYTwV3Q3wGf/xqlgK6vKD3mHq1+d2kvjvD3Ek
	dITxvzl8Qvf3XW8sccVsrIjoXnzvXnbYgKkMtd3faWCsfg52nulH5YbGv+LPw1kwhxZla9Jtttgxj
	MCdKVG89mXjJgKpGmjNxH8QFzgGl4nu/wZgd94sJTIuBOkuD/ronvqoEmMQuyUlb3XKJU8jP0Jd2f
	mpvioenOcKYMPckx/hHENrJDXatNoxP2SoynuMKpdjaFnz3I4fGeBoo0XQPQYI7lPf+BR3fur4Xvb
	2fO0HxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqL9-00AGXV-2f; Fri, 22 Oct 2021 08:55:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqL4-00AGVe-7v
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Oct 2021 08:55:47 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9347B40003
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Oct 2021 08:55:44 +0000 (UTC)
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
Received: by mail-lf1-f70.google.com with SMTP id
 p19-20020a056512139300b003ff6dfea137so1441183lfa.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Oct 2021 01:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ti/kWwWZCiPv4gL/LdQf6/gYsg4XXLTy9z9bRwDkCkI=;
 b=KjziyMQLucbOpJ562JejHAIVwYQn+evj4eUU4nlK/2bteQjIQVctlINDNliVZJvwLm
 ZEPTdPlQhn6SCfHY31J0LLNPHYAuv6+IFnwdtO2Gsj2eMSa1V4v3EZDXuhDdGeYuo50S
 ozq54T0VsAy9nSYlnkZ9GtT36e+0EGpsamTM946XNMCQqYuLxgLgcIt6WmbW3en6cmXK
 n1iEK39IFN6UUXgFNi6bsid+4zUM/fGfH/i0fJumPW4XOK+UQeCICfRk4EEWWGibRNng
 gcREDQk6ef6Ps2CPkO7bi5eBiBljbumB/cbJfVQnCM/zsp6w33Jt+jlZofkOOKvtVkbL
 NG1w==
X-Gm-Message-State: AOAM530M24sxs8YhHNZcfeVYmwTGAJHrC/g4VKGUvK/EyLeoR7EihXEU
 A5ZkAcai/41rfTSdRy66/BRIyJY36wQiLoRCfnNhIp4+H5s1hUDNexpAPJWz15yT4jEZc6Adphe
 Rvz+YdnX4oNMbMrQxS6lDAwRSRFcNVx5Fhjbh+arPuEQI+H8FfDuC
X-Received: by 2002:a19:fc01:: with SMTP id a1mr10557859lfi.214.1634892943599; 
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
X-CRM114-CacheID: sfid-20211022_015546_450253_B31BA0A8 
X-CRM114-Status: GOOD (  15.65  )
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
Message-ID: <20211022085542.8WUlaVgnkJ-K5b7eXyYlfmrlrrz9YPv4LfgPvAFyjOk@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
