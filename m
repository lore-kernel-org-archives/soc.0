Return-Path: <SRS0=X3Ea=3P=loongson.cn=zhuyinbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7224EC4332F
	for <soc@archiver.kernel.org>; Tue, 15 Nov 2022 02:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 398C9C433C1; Tue, 15 Nov 2022 02:59:36 +0000 (UTC)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 1B63DC433D6;
	Tue, 15 Nov 2022 02:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B63DC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8BxbbaTAHNjBCAHAA--.9592S3;
	Tue, 15 Nov 2022 10:59:31 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPuKSAHNjPC4TAA--.51482S2;
	Tue, 15 Nov 2022 10:59:30 +0800 (CST)
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
Message-ID: <2cfeb906-4d5d-5049-574f-40787728845a@loongson.cn>
Date: Tue, 15 Nov 2022 10:59:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <79ecabde-e561-4f7d-8c6f-78331c880e04@app.fastmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxPuKSAHNjPC4TAA--.51482S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWruFy8tr18AryDZF1UAF15twb_yoWDWrgE9F
	WkZryxCr18XF4DK3ZFqF4rur4I9ryjva40vry8Ka1Sg34jyFnxJa1j9342g3WUKF4rKFnx
	X39a9r1vyr93ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	c7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzNtxUUUUU



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
I misunderstood your meaning. I mistakenly thought that there was a 
problem with the patch test, in fact, it means that the automated 
tracking does not work, and I only need supply a no merge confilict 
patch and that automated tracking issue will can fix, right?
> 
> I suspect the patch was not generated against a recent -rc release
> but either a previous kernel or the current git HEAD commit for
> the loongarch tree.
> 
>       Arnd
> 

