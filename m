Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DBD8C06
	for <soc@lists.linux.dev>; Tue, 24 Sep 2024 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727186763; cv=none; b=ioWRF8YKLsv+CZoKyXN/e9PIvsBRSJ0T5GqlTXrF3OiCmKyhI9VeQ/8NfM1T+nIXNe3BvX19zf6zADA9GD6vd6JCLGIqDchc0KtwsJU4aYCXs9mBoLQEibfn7XTXxEmIUhKuN/HWgwtNeZ0G4uvImryVqTks9gNORVj7IZpGE+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727186763; c=relaxed/simple;
	bh=YJSpLiSt8Lk2aNqzxMqV5s+yzU2yYXY0HPU9GFppqvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GlCn8wNY2DJbNu0gf1aWRclZxEoAuR5MUSAFdPey/yHHTUW4BIr6lXTUjw+4QMv4Y12LlKfnCwaj7aut1++bqnC6q9imvGab3/2DAuRsuUHaUrGz1gOB39MJ4dF9TDeQTkZiR7A94A4oMh36Lg1wpz10tDv2oEXMNSyGrhPlbgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pVJbQPsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pVJbQPsP"
Received: by smtp.kernel.org (Postfix)
	id A150EC4CECF; Tue, 24 Sep 2024 14:06:01 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0C40C4CEC4;
	Tue, 24 Sep 2024 14:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0C40C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727186759; x=1758722759;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YJSpLiSt8Lk2aNqzxMqV5s+yzU2yYXY0HPU9GFppqvA=;
  b=pVJbQPsPG3dk6N/uGwX5y9Oq4TYJSdjAqRblBTPEA32EXEiR90szSme1
   Jlm+I/0QMbPTfaJsdNLjWYMgQn8L7vRHuQAZ68KILw3Qw2l8fX62arodb
   YlbOYDfBFCI8TyuC6LDnCKBzCNHQi7ZwhsjO2j+yGlpIIhk63GS6caqFk
   Mm9RvKcKvZe7xWpOJeOCZxgPCSBrjXS+rmHQ7iIQ8ZxN13sETNpdEe/FQ
   TStwS1hrKRwZtM3HsDZdfjIy0Q+oFY/iYD3XwPiyy94nRHsoyftedNFy6
   42OpYLIuJgRAhSjw7dGquh9ROkOfvNJ95f5DrkQa8yoHLBSR22LLQRMJJ
   A==;
X-CSE-ConnectionGUID: P0BX6q2GSA2yLug+77A/7Q==
X-CSE-MsgGUID: /ZwffnThTUyCqbPG7pZiYw==
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="35400960"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2024 07:05:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 24 Sep 2024 07:05:29 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 24 Sep 2024 07:05:28 -0700
Message-ID: <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
Date: Tue, 24 Sep 2024 16:05:45 +0200
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
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Daire McNamara <daire.mcnamara@microchip.com>, <soc@kernel.org>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2024 at 13:46, Conor Dooley wrote:
> Hey folks,
> 
> I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
> that, but I would like to propose some changes to how the Microchip soc
> support is maintained - mostly affecting the riscv side of things that
> I've been maintaining in my personal tree, alongside other platforms.
> I'd like to propose moving those from my tree, into the at91 tree.

I don't know if the "at91" naming will remain a right designation of 
what we're doing in the future, but well, let's stick to it for now.
Some find it a little too much tight to the old Atmel brand...

> While the dts bits for the arm and riscv platforms have no overlap
> and nothing is particularly gained from me moving which tree
> location they're in, I'm far more interested in disambiguating the tree
> that soc and/or firmware bindings and drivers end up in.
> 
> I was going to add the bindings/soc/microchip directory to the
> maintainers entry I have for drivers/soc/microchip, but while doing
> that, I noticed that there have been recent patches for sam and sparx5

FYI: and we have the older drivers/soc/atmel directory (which is caught 
by "ARM/Microchip (AT91) SoC support" entry).

> bits that have added files to that bindings directory that went via at91
> and I figure it's almost certain that there'll be drivers added before
> too long. Having a single location, like we do at the moment for clocks,
> would make the route upstream for things a bit clearer - and I figured
> that while moving one thing, might as well move the firmware and dts
> stuff too.
> 
> My assumption is that the riscv dts bits would retain their own branch,
> and that I'd still send the PRs for them and for the firmware stuff given
> that there's no !riscv soc content in that directory yet - and I don't
> want to saddle Claudiu with more work for devices he probably doesn't
> care about...
> 
> Seem reasonable?

That's fine with me Conor. It makes a lot of sense as we're working on 
more and more topics together.

Best regards,
   Nicolas

