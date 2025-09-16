Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040F2641E3
	for <soc@lists.linux.dev>; Tue, 16 Sep 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028772; cv=none; b=HbDEvMbPnT/dvxjVjcI+fPrz3F0w6gVaCoXnDugGsCKRaW8FrU6/g/CoVhBVjoSd4S934Dbh/ILU5BnhvRQ+LmehnFLThSW4UemF4Gr2FX2fFDdf7fSh9o9po/h03320tBRE7kRV3aAQQHC6V9nAWaGwiYFD7qq7CRXNiZfH8lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028772; c=relaxed/simple;
	bh=GCqjILCeKyNT+/Gxo+qzeEjfs57+lZtCCEoAb15K/7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YYHvDKxVheLual94LqYi0xZW7psLzqN0rNsnTClJiulE2MHI7alNEc4NkA86c5DtJTVstOGR63MVKeSmX/PKppqE4rJrsxYuDnovedxJ6sUM6pPSM79E8blPKtlVEhhj8fK2022PUn4Q5qpVEYPuQp5C4pSopKs4COAhx0WH3wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=n3zHmSOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n3zHmSOC"
Received: by smtp.kernel.org (Postfix)
	id E7C00C4CEFA; Tue, 16 Sep 2025 13:19:31 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0267C4CEEB;
	Tue, 16 Sep 2025 13:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0267C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758028770; x=1789564770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GCqjILCeKyNT+/Gxo+qzeEjfs57+lZtCCEoAb15K/7Q=;
  b=n3zHmSOCT4l074ytm3AL8r+YFjroj0CiAlWgwVZiF2LJb4smkHa4+J7u
   3WZsCGg9maQsMGRaEdaqATKy9ldVAL7lGvYmEIjeWJYlcBWjVZs7eXv6k
   D/FRyM9c/FwNjGe2KLEQH5cw6zWyg9WW+62TgASBWjJkraOzgfXGgECgU
   +dAPzT5G6GbpEiyrCCqYcHOGpMemwULWHpsjG7YmjQdUUb83aDpXyacPX
   bPyvOaz8d5vDlUCJH18tflQORMCZeI+xxf0JGEce+GwjGeuLZ8pF8683G
   2ZfeaoeklhRtto0lpBuzr0MscsI6ZgHOGTcaITpWylouBT2GV3/Jk3GHF
   A==;
X-CSE-ConnectionGUID: V/byoQjpSTeHg7RE9/pKtQ==
X-CSE-MsgGUID: IY9Gcb90RGOMWsNzTufLXQ==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="52399102"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 06:19:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 06:19:15 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Sep 2025 06:19:12 -0700
Message-ID: <0695ca65-536c-48d9-ad1b-49452e67a6f9@microchip.com>
Date: Tue, 16 Sep 2025 15:19:11 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: microchip: clk for 6.18 #1
To: <sboyd@kernel.org>, <mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, SoC Team
	<soc@kernel.org>
CC: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, <oe-kbuild-all@lists.linux.dev>,
	<llvm@lists.linux.dev>, kbuild test robot <lkp@intel.com>
References: <20250916080545.9310-1-nicolas.ferre@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250916080545.9310-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/2025 at 10:05, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear clock maintainers,
> 
> Here are the first clk changes for 6.18.
> I don't think they have conflict with changes for the deprecated round_rate()
> to determine_rate() topic.
> They are in linux-next for a couple of days.

But... this series depends on this patch:
https://lore.kernel.org/r/20250827145427.46819-4-nicolas.ferre@microchip.com

Which will be part of a pull-request to-be-sent soon to arm-soc (which 
is part of linux-next, so the build error doesn't appear there).

Once the pull-request is done, do you prefer that I do an immutable 
branch between CLK and ARM, that I queue this at91 PM patch into the clk 
pull-request or that everything goes through arm-soc?

Thanks to the kbuild test bot.
Regards,
   Nicolas

> Please pull. Thanks, best regards,
>    Nicolas
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>    Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.18
> 
> for you to fetch changes up to e3130c2a9a0c8e549e044e659be6f762a1b1f725:
> 
>    ARM: at91: remove default values for PMC_PLL_ACR (2025-09-15 16:24:25 +0200)
> 
> ----------------------------------------------------------------
> Microchip clock updates for v6.18
> 
> This update includes:
> - add one clock for sam9x75
> - new meaning for MCR register field in clk-master
> - use force-write to PLL update register to ensure
>    reliable programming sequence
> - update Analog Control Register (ACR) management to accommodate
>    differences across SoCs
> 
> ----------------------------------------------------------------
> Balamanikandan Gunasundar (1):
>        clk: at91: sam9x7: Add peripheral clock id for pmecc
> 
> Cristian Birsan (2):
>        clk: at91: add ACR in all PLL settings
>        ARM: at91: remove default values for PMC_PLL_ACR
> 
> Nicolas Ferre (1):
>        clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
> 
> Ryan Wanner (1):
>        clk: at91: clk-master: Add check for divide by 3
> 
>   drivers/clk/at91/clk-master.c      |  3 ++
>   drivers/clk/at91/clk-sam9x60-pll.c | 82 +++++++++++++++++------------------
>   drivers/clk/at91/pmc.h             |  1 +
>   drivers/clk/at91/sam9x60.c         |  2 +
>   drivers/clk/at91/sam9x7.c          |  6 +++
>   drivers/clk/at91/sama7d65.c        |  4 ++
>   drivers/clk/at91/sama7g5.c         |  2 +
>   include/linux/clk/at91_pmc.h       |  2 -
>   8 files changed, 59 insertions(+), 43 deletions(-)
> 
