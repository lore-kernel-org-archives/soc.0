Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345D2737E3
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667453; cv=none; b=hXtKcaziHosbOgDD+KVg0659pAvnFsrBwO4iQnpLueGzOAyvyQ+yLl8krtpMcRtQbUPk6Yezmv76d60sdce7Kn1tqUsXjio0/Xl3SAXkypD+IWEAugfb7Lw8uqJfuCyMG0pwKFXSQvxtqfWoSYCClGMDwgsLumzMvGbCoJRlfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667453; c=relaxed/simple;
	bh=ZIYDSt04Y1IRNtggUK5RxE83YKlG/z5W58KhYO8o8as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ck9G8XfvMVIXSiuM1HEzFE6wvqzX4h8DNBX7bz2vYYBXE5MCZcibJ4T5A/A1WkuFC78tiIZ9KMKsND56L02MtXO6DSdkLzsnH1RS1BWhGXB9BbOq6h9bcEVyN4Thr5inlQ8niHmlpEDfXiz2ccIqOC7mRDjyyYfmiPgDZxqs4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dx8eZ1GR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dx8eZ1GR"
Received: by smtp.kernel.org (Postfix)
	id 9B72DC4CEF1; Fri, 12 Sep 2025 08:57:32 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 134D5C4CEF7;
	Fri, 12 Sep 2025 08:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 134D5C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757667449;
	bh=ZIYDSt04Y1IRNtggUK5RxE83YKlG/z5W58KhYO8o8as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dx8eZ1GRFH4rmvamm7zkNfQA8c7ZbEL7CoKMHnb1FM1odU3jGAQcvvDU6LvK/yavb
	 QESmSjQ81cxHGMLDBY+He03WwTsn8/GFbH+kdkpeopTRFB1tJbLZMuHvt4EecCkaEn
	 zyBd29qeDnJS/nSkBt33ltxhFBt1blYmQrmgG6mmMLtFMvnbZ13geDBf//Cl3SebBc
	 +gr/UneA+XwL7n/qMMm4GnxjH29WnMLE2rY5gAVwqUQdKpEve3WF6YFXPeT3TwDyEC
	 EnwBu8c3aPtv8ou5BN4b6A0B5K3fJztjXilvoXyQTJuIppH8JxMNn4T9YlBLy2vo/p
	 10BmOVnNGem+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB18D17E127C;
	Fri, 12 Sep 2025 10:57:28 +0200 (CEST)
Message-ID: <9bb0fb8f-220c-4edb-9896-cc36f669624a@collabora.com>
Date: Fri, 12 Sep 2025 10:57:28 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
 <CAGXv+5F=uPnzrpDtPXc2ipwp5AhiEwGdxhuhPtjwWhAxWJMc_Q@mail.gmail.com>
 <6037201a-a13f-4a3d-9377-3f9f91e78773@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6037201a-a13f-4a3d-9377-3f9f91e78773@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 12/09/25 09:11, Matthias Brugger ha scritto:
> 
> 
> On 11/09/2025 07:23, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Wed, Sep 10, 2025 at 11:04 PM Matthias Brugger
>> <matthias.bgg@gmail.com> wrote:
>>>
>>> Hi Arnd,
>>>
>>> can you please have a look on the following patches.
>>>
>>> Thanks a lot,
>>> Matthias
>>
>> I still have some patches outstanding for some time. Could you perhaps
>> take them as well?
>>
>> [PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback
>> compatible to mt8186
>> https://lore.kernel.org/all/20250610063431.2955757-3-wenst@chromium.org/
> 
> Queued now for a possible 2nd pull request.
> 
>>
>> [PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
>> https://lore.kernel.org/all/20250812090135.3310374-1-wenst@chromium.org/
> 
> Queued now for a possible 2nd pull request.
> 
>>
>> [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
>> https://lore.kernel.org/all/20250814092510.211672-1-wenst@chromium.org/
>>
> 
> Queued now for a possible 2nd pull request.
> 

Matthias, since you're managing this pull - can you please grab the patches that
are relevant to our trees from my sanitization series?

https://patchwork.kernel.org/project/linux-mediatek/cover/20250724083914.61351-1-angelogioacchino.delregno@collabora.com/

Thanks,
Angelo

> Thanks for the heads up!
> Matthias
> 
>>
>> Thanks
>> ChenYu
>>
>>> ---
>>> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
>>>
>>>     Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/
>>> tags/v6.17-next-dts64
>>>
>>> for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:
>>>
>>>     dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:16 +0200)
>>>
>>> ----------------------------------------------------------------
>>> mt7988 (bpi r4):
>>> * enable network
>>>
>>> mt7986:
>>> * add dedicated sram node
>>> * add interrupts for RSS to ethernet
>>>
>>> mt7981:
>>> * add thermal sensor and auxadc nodes
>>>
>>> mt8395 (NIO 12L):
>>> * enable UFS
>>> * add gpio keys to the PMIC
>>>
>>> mt8195:
>>> * drop reset for PCIe device
>>>
>>> ----------------------------------------------------------------
>>> Aleksander Jan Bajkowski (1):
>>>         arm64: dts: mediatek: add thermal sensor support on mt7981
>>>
>>> Frank Wunderlich (7):
>>>         arm64: dts: mediatek: mt7986: add sram node
>>>         arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt names
>>>         arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>>>         arm64: dts: mediatek: mt7988: add switch node
>>>         arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>>>         arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
>>>         arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
>>>
>>> Guoqing Jiang (1):
>>>         arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0
>>>
>>> Julien Massot (2):
>>>         arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
>>>         arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
>>>
>>> Mateusz Koza (2):
>>>         dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>>>         dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
>>>
>>> Rob Herring (Arm) (1):
>>>         arm64: dts: mediatek: mt8183: Fix out of range pull values
>>>
>>>    .../devicetree/bindings/arm/mediatek.yaml          |   2 +
>>>    arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
>>>    arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
>>>    .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
>>>    .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
>>>    arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++++++++-
>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
>>>    arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
>>>    arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
>>>    .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
>>>    11 files changed, 508 insertions(+), 23 deletions(-)
>>>
> 

