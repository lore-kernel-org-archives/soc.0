Return-Path: <SRS0=Nqz8=3L=loongson.cn=zhuyinbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0274CC433FE
	for <soc@archiver.kernel.org>; Fri, 11 Nov 2022 06:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9EE1C43470; Fri, 11 Nov 2022 06:08:19 +0000 (UTC)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id B81B7C433C1;
	Fri, 11 Nov 2022 06:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B81B7C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8DxOdjN5m1jnwYGAA--.17156S3;
	Fri, 11 Nov 2022 14:08:13 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx5VbL5m1j27EQAA--.27161S2;
	Fri, 11 Nov 2022 14:08:12 +0800 (CST)
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2
 platforms
To: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, WANG Xuerui
 <kernel@xen0n.name>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Lubomir Rintel <lkundrak@v3.sk>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Brian Norris <briannorris@chromium.org>, Sven Peter <sven@svenpeter.dev>,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
References: <20221104024835.3570-1-zhuyinbo@loongson.cn>
 <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
 <574d58b2-0e9a-4fa0-84a8-caf39a9bc37a@app.fastmail.com>
 <CAAhV-H64s-2gNMd0-F21kUzieh5G-MbBnA0k6J8EP2_7SpevaA@mail.gmail.com>
 <0b2ca852-61b2-4e88-b389-f102994d5b2d@app.fastmail.com>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <b9ec5b1c-053d-a2a7-81ab-bc8066eb9159@loongson.cn>
Date: Fri, 11 Nov 2022 14:08:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0b2ca852-61b2-4e88-b389-f102994d5b2d@app.fastmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx5VbL5m1j27EQAA--.27161S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJw1fAF17KFykGr1DuryrXrb_yoW5AF1fpF
	WrtFnxCF4kGF43Ar1Iyw1Uuayrtw4ayr9IgF9Yg34kZF95ZFyIyFy0vFyruF4DXF1fKr4j
	vF18A348u3WkZF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8c_-PUUUUU==



ÔÚ 2022/11/9 ÏÂÎç11:08, Arnd Bergmann Ð´µÀ:
> On Wed, Nov 9, 2022, at 14:50, Huacai Chen wrote:
>> On Wed, Nov 9, 2022 at 7:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Wed, Nov 9, 2022, at 11:15, Linus Walleij wrote:
>>>> On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>>>>
>>>>> Hi maintainer,
>>>>>
>>>>> This patch I had verified that base on mainline 6.1-rc3 tree, it is
>>>>> okay, if no other issue, please you help me merge it to upstream.
>>>>
>>>> Aren't these loongarch maintainers listed in MAINTAINERS able to
>>>> merge this? Certainly Huacai can merge stuff to drivers/soc as
>>>> need be. drivers/soc is a bit shared between different archs.
>>>
>>> I'm generally happy to keep an eye on stuff in drivers/soc/ across
>>> architectures and merge it through the soc tree, especially for
>>> new platforms, but merging this through the loongarch tree works
>>> as well.
>> So drivers/soc is similar to drivers/platform that can be merged
>> through corresponding architecture trees?
> 
> Right, I think in both cases, there is no top-level subsystem
> maintainer, but the rules are specific to the second-level
> hierarchy: most parts of drivers/platform/ happen to go
> through the x86 platform maintainer trees, and for drivers/soc
> we merge most stuff through the soc tree, but a few parts
> of each have different maintainers.
> 
>>> Since the driver was already sent to soc@kernel.org, I can
>>> simply pick it up through patchwork[1] when I do my next round
>>> of merges. I'll leave this up to Huacai Chen and WANG Xuerui,
>>> let me know if you prefer to merge it through the loongarch
>>> tree.
>> I'm happy that this series be merged through your linux-arch tree, but
>> if it is better (I'm not sure which is better) to go through loongarch
>> tree I can also merge it later. However, I have some comments about
>> this version. :)
> 
> I would prefer the soc tree, and will just apply the
> patches from Yinbo Zhu directly this time as I already
> have them in my queue. If there are more than a few
> drivers/soc/loongarch/ patches in the future, maybe you can
> pick them up into a separate branch and forward those
> to soc@kernel.org.
> 
> Note that I have two separate roles here: I have the
> asm-generic tree that I maintain for patches to
> include/asm-generic as well as the occasional new
> architecture review as I did for loongarch.
> 
> The other one is the group maintained soc tree that
> is mainly for Arm device tree files, but also contains
> soc specific code (arch/arm/mach-*), defconfig files,
> drivers (drivers/{soc,firmware,memory,reset}). This is
> now extended to arch/riscv and occasionally other
> architectures as well, so drivers/soc/loongson fits
> well in here.
> 
>       Arnd
Hi Arnd Bergmann,

I had add v7 version patch and please help check and merge it.
in addition, I don't find apprioate branch in your tree for test, so
my patch was tested that base on 6.1-rc3 master branch.

BRs,
YinBo.
> 

