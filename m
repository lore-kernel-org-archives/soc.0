Return-Path: <SRS0=X3Ea=3P=loongson.cn=zhuyinbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FAEC4332F
	for <soc@archiver.kernel.org>; Tue, 15 Nov 2022 01:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0322C433C1; Tue, 15 Nov 2022 01:11:43 +0000 (UTC)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 180D3C433D6;
	Tue, 15 Nov 2022 01:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 180D3C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8CxbbdK53JjsBcHAA--.16247S3;
	Tue, 15 Nov 2022 09:11:38 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuBH53JjGh8TAA--.50832S2;
	Tue, 15 Nov 2022 09:11:35 +0800 (CST)
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
Message-ID: <c244afdc-2c3e-2ecc-b933-ca2b008149be@loongson.cn>
Date: Tue, 15 Nov 2022 09:11:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <79ecabde-e561-4f7d-8c6f-78331c880e04@app.fastmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuBH53JjGh8TAA--.50832S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWruFy8tr18AryDZF1UAF15twb_yoWDJrbEga
	ykArWUCr1UJrWxW3Z3tF4furs29Fy7Za40vryrKa1S9w15tFsxWw4jvryfW3W7Kr4fWFnx
	Zr9xKrZ5Crn3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	w7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF
	6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14
	v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY
	64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7
	Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UQzVbUUUUU=



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
> 
> I suspect the patch was not generated against a recent -rc release
> but either a previous kernel or the current git HEAD commit for
> the loongarch tree.
> 
>       Arnd
Hi Arnd,

This patch that was base on mainline tree 6.1-rc3 master branch and  I 
have a verified test, It is okay, May you tell me I should test it
on which tree and branch. I will have a test that use my v7 patch.

Thanks,

BRs,
Yinbo.
> 

