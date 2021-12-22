Return-Path: <SRS0=hwu8=RH=ti.com=vigneshr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B99C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 07:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D69FEC36AEB; Wed, 22 Dec 2021 07:26:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87A5FC36AE5;
	Wed, 22 Dec 2021 07:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87A5FC36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BM7QBuE065933;
	Wed, 22 Dec 2021 01:26:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1640157971;
	bh=njV403yu82V9mkGKIO0guJ2JCXwS2FplGRPA6nda75Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vfTCUXqSfqiyqGCVXhmKqvs4Ut3lL4NPXXCrv81R1rBd+yCNLDDZJST7PF0ogqmZr
	 sGfHHrKGfUBKrYw2s5eLtDVooH/2KYDuy3hl9Hjw4K61YteeFYjicJRh7nvCQKby6p
	 nDgVGDMA2dPDY2GAk5lY2NYtzcE3PCmgk4GaoxxI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BM7QBX2046939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Dec 2021 01:26:11 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Dec 2021 01:26:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 22 Dec 2021 01:26:11 -0600
Received: from [10.250.235.203] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BM7Q7uK015944;
	Wed, 22 Dec 2021 01:26:07 -0600
Message-ID: <9a5d6b32-7e2a-0eae-aed4-97291e4c3f97@ti.com>
Date: Wed, 22 Dec 2021 12:56:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
        SoC
	<soc@kernel.org>, arm-soc <arm@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        KISHON VIJAY ABRAHAM <kishon@ti.com>
References: <20211217172806.10023-1-vigneshr@ti.com>
 <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
 <06e60038-1365-fc35-801e-448c9025fb2a@ti.com>
 <20211221153250.GA2081238@bill-the-cat>
 <CAK8P3a2wNNSQkN_m3DzEF5RLmq1aED1JpOkXW9Yq13+ypiAaGQ@mail.gmail.com>
 <20211221160933.GM2773246@bill-the-cat>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20211221160933.GM2773246@bill-the-cat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 21/12/21 9:39 pm, Tom Rini wrote:
> On Tue, Dec 21, 2021 at 04:55:48PM +0100, Arnd Bergmann wrote:
>> On Tue, Dec 21, 2021 at 4:32 PM Tom Rini <trini@konsulko.com> wrote:
>>> On Mon, Dec 20, 2021 at 11:10:25PM +0530, Vignesh Raghavendra wrote:
>>>>
>>>> Currently its not possible to build PCIE_CADENCE_PLAT_HOST/EP drivers as
>>>> modules (symbols are bool only).
>>>> PCIe is not necessary for basic boot either. So, I can drop these
>>>> configs until these drivers are build able as modules, if you prefer.
>>>
>>> Is PCIe required for basic boot for the other platforms in the defconfig
>>> which do enable it in the defconfig today?  It is required for non-basic
>>> boot (whatever storage one puts in a PCIe slot).  If someone is going to
>>> be fixing the PCIe driver to be able to be modular, that's fine too but
>>> I ran in to this trying to see what works out of the box in the
>>> defconfig, on this platform and hit both of these rather large
>>> omissions.
>>
>> If PCI is often used for storage, then that's ok. There are a number of
>> other platforms where PCIe is only used for wireless networking or
>> other secondary devices, but they are still built-in because they got
>> added before it became possible for PCIe host drivers to be loadable
>> modules. I would like to eventually go through and turn those into
>> loadable modules, but for the moment it would be good to only add
>> built-in drivers where this is actually useful.
> 
> That's good to know.  My question tho is, what's actually useful?  The
> EVM is 2 PCIe x8 type slots.  I honestly don't know if that means "super
> useful, arbitrary devices are expected to work" or "not useful,
> arbitrary devices are not expected to work".  Is the functional
> definition of what's in the defconfig vs left up to users,
> distributions, etc, to find and enabled defined, or at least well known
> / explained somewhere?  Where I'm coming from on this is that these
> platforms practically are, and can be SystemReady IR certified.  So
> what's needed here to ensure there's a good experience distros to enable
> what needs enabling for full functionality?  What we hit was "lets throw
> some stuff at this board to test it out and.. wait, PCIe isn't enabled
> at all? USB host isn't enabled at all?"
> 
> And all that said, if someone is going to be fixing the PCIe drivers to
> be enabled as modules soon, and just getting it handled that way in the
> next appropriately timed merge window, OK, fine, good enough.
> 

Looks like its not a big effort to convert J7 PCIe driver to build as
module and can be done for v5.18 Merge Window. So how about we enable
only USB controller drivers now and then enable PCIe after its
build-able as module?

Regards
Vignesh
