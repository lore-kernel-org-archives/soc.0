Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687C189505
	for <soc@lists.linux.dev>; Fri, 27 Sep 2024 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727424220; cv=none; b=cXshTC60431xeXnWb5RbH55yGTBtrXyS1x2RMVodQRnu+Ao/gXIpATzQHnzFN+/Qb9MGDRgDS4UOHW1iNEhIToSI+A1pTXHehUvtbU0xvGognbsxQq0E4VrPD7Jsx4KBkBBtjN0aMYffX86fnxPHWoT8i1YvUjRMM40x0Me1Mio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727424220; c=relaxed/simple;
	bh=9WSak1cIz5VlZVexRIncOtzRcNk18HknuNYNpVIK+e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=McuCQ9NxrqAAjuj/VXzBFAY8ZSTFhlUG73xcCtuHDWl72PLwvLhECxafVXEU6ecJHQevH/AyyZkgM+JJLe4g5yQ4d8mYNbKrvMktqQ+OERCdppyDNZiuN5YInY29404gXoYWxBXNmf2V1paVXLbgL/1x8xaeByNIi2DtZg7pfX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=FxDIFe8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FxDIFe8n"
Received: by smtp.kernel.org (Postfix)
	id 2512BC4CEC7; Fri, 27 Sep 2024 08:03:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D31DC4CEC4;
	Fri, 27 Sep 2024 08:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D31DC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727424218; x=1758960218;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9WSak1cIz5VlZVexRIncOtzRcNk18HknuNYNpVIK+e4=;
  b=FxDIFe8n5+UsxVcHtJ9+/FlKIfyr2SCPo7NU3VTPmVjC8z2iWK2v87Hr
   IFBfh5T6u11+qa7USZUdYsQLc4XAtC239l1hhOUxkCRwEdl8TNaKa3EP/
   exFVqNqk+buAZIZ+RS1JCLUQK+W5n7SSa80JOPJV6JKDST5wVlV+UoAhE
   Ub2pFgoQ2xSa+7s5841HmUxqzSBpckv+eJd1Zs4znur6kP12EOA8Lm9ep
   ge2ifN0oFuVYZCnQv/VjVWB/yEhMk3O+Z79kUyZzeV4AbUt0g3H9/0hLl
   vaMI/pTPlhePd8zDrSo8SVQBoB4ZwDg0d7kxyN1B3vkhGNP5inIiUD7um
   Q==;
X-CSE-ConnectionGUID: bucuDyjeQJuqr/xYh/A5Ag==
X-CSE-MsgGUID: 47Iw06lFQnS30ksO1x56zw==
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="32175168"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Sep 2024 01:03:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 27 Sep 2024 01:02:47 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 27 Sep 2024 01:02:46 -0700
Message-ID: <c2195bd3-f27f-4594-b414-6a54586d16bb@microchip.com>
Date: Fri, 27 Sep 2024 10:03:02 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: microchip soc maintainance change proposal
Content-Language: en-US, fr-FR
To: Conor Dooley <conor@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: claudiu beznea <claudiu.beznea@tuxon.dev>, Daire McNamara
	<daire.mcnamara@microchip.com>, <soc@kernel.org>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
 <202409241424582a8b426d@mail.local>
 <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>
 <20240925-absolute-jockey-1518cceb2884@spud>
 <20240925175952d2737996@mail.local>
 <20240926-retiring-grumbly-5231f2c2162e@spud>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240926-retiring-grumbly-5231f2c2162e@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 26/09/2024 at 19:19, Conor Dooley wrote:
> On Wed, Sep 25, 2024 at 07:59:52PM +0200, Alexandre Belloni wrote:
>> On 25/09/2024 17:16:10+0100, Conor Dooley wrote:
>>> On Wed, Sep 25, 2024 at 10:34:10AM +0300, claudiu beznea wrote:
>>>>
>>>> On 24.09.2024 17:24, Alexandre Belloni wrote:
>>>>> On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
>>>>>> On 24/09/2024 at 13:46, Conor Dooley wrote:
>>>>>>> Hey folks,
>>>>>>>
>>>>>>> I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
>>>>>>> that, but I would like to propose some changes to how the Microchip soc
>>>>>>> support is maintained - mostly affecting the riscv side of things that
>>>>>>> I've been maintaining in my personal tree, alongside other platforms.
>>>>>>> I'd like to propose moving those from my tree, into the at91 tree.
>>>>>> I don't know if the "at91" naming will remain a right designation of what
>>>>>> we're doing in the future, but well, let's stick to it for now.
>>>>>> Some find it a little too much tight to the old Atmel brand...
>>>>>>
>>>>> We could take this opportunity to rename the tree microchip or mchp.

I'm voting for "microchip" so it's very explicit.

>>>> +1
>>> I personally don't care at all about the tree being called at91 or w/e,
>>> but I wouldn't object to a rename to either. I can whip up a mail to the
>>> helpdesk if yous like.
>> Yeah, I guess you can ask for the rename and be added to the list of
>> users that can push to the repo. At the same time, you can send a patch
>> to update the MAINTAINER entry so we can ack it.

> I'm actually already in the group 😉 Do we want there to be a redirect
> from the at91 url to whatever the new one is? Konstantin said that it is
> possible, it'll take him about 5 mins to set one up.

Fine so that we can use whichever URI that we prefer and can continue to 
have the link to linux-next established (even if it's easy to modify 
with Stephen).

Let's go for this if everybody agrees.

Best regards,
   Nicolas
