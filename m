Return-Path: <SRS0=X3Ea=3P=loongson.cn=zhuyinbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A162DC433FE
	for <soc@archiver.kernel.org>; Tue, 15 Nov 2022 01:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88FEBC433D7; Tue, 15 Nov 2022 01:16:57 +0000 (UTC)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id EAC9BC433C1;
	Tue, 15 Nov 2022 01:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EAC9BC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8AxStiD6HJjNxgHAA--.19529S3;
	Tue, 15 Nov 2022 09:16:51 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+KB6HJjsh8TAA--.51469S2;
	Tue, 15 Nov 2022 09:16:50 +0800 (CST)
Subject: Re: [PATCH v7 1/2] soc: loongson: add GUTS driver for loongson-2
 platforms
List-Id: <linux-soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, patchwork-bot+linux-soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, zhuyinbo@loongson.cn
References: <20221111054201.18528-1-zhuyinbo@loongson.cn>
 <166843982063.12382.5702013296268460619.git-patchwork-notify@kernel.org>
 <79ecabde-e561-4f7d-8c6f-78331c880e04@app.fastmail.com>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <ae34eae9-3146-e095-3d02-e93f00586a5f@loongson.cn>
Date: Tue, 15 Nov 2022 09:16:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <79ecabde-e561-4f7d-8c6f-78331c880e04@app.fastmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxb+KB6HJjsh8TAA--.51469S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWruFy8tr18AryDZF1UAF15twb_yoWfKFcEga
	s5CrW8Gr4UGF4DGa92qFs3ZrZa9FyUX340vry8K3WfKw4UJFnIkw4jv342g3W2ga1rKFnx
	XrZIqFn3Crn3XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	q7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc80
	4VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
	cVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x8Erc
	xFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAV
	WUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU
	rcTmDUUUU



ÔÚ 2022/11/14 ÏÂÎç11:37, Arnd Bergmann Ð´µÀ:
> On Mon, Nov 14, 2022, at 16:30, patchwork-bot+linux-soc@kernel.org wrote:
>>
>> Here is the summary with links:
>>    - [v7,1/2] soc: loongson: add GUTS driver for loongson-2 platforms
>>      (no matching commit)
>>    - [v7,2/2] dt-bindings: soc: add loongson-2 chipid
>>      https://git.kernel.org/soc/soc/c/06ebd23a33ec
> 
> The first commit had a small merge conflict against linux-6.1-rc2
> that I resolved. It's all merged now, but it caused me a little
> extra work, and it means that the automated tracking does not
> work.
It has merge conflict that should be MAINTAINERS file, because I have
other patch for upstream that have a change in MAINTAINERS file, but all
patch patch was generated was 6.1-rc4 and test it that was base on 6.1-
rc3.
> 
> I suspect the patch was not generated against a recent -rc release
> but either a previous kernel or the current git HEAD commit for
> the loongarch tree.
> 
>       Arnd
> 

