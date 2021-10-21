Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4735C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 22:10:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8E5FA61359; Thu, 21 Oct 2021 22:10:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B3861073;
	Thu, 21 Oct 2021 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634854223;
	bh=GF0wSOnS41VXkjN2xtpwe653+QKWfXg2+En6IL+JZZ0=;
	h=Subject:To:List-Id:Cc:References:From:Date:In-Reply-To:From;
	b=camFxjdhgqdA39oLjPRUAcqoFKGtbzzqQhoO52fvtK+pNN7qGRfTlJLFheCGOZcKj
	 y6m1Ej/6hCN/0lqTPc/Ls/DwyjQwAdDt2pJ+YLVmrn138/11glihXS/ILMmQpJ8/di
	 ioe4g6Ve+Cnxl97t6dqdhY3WkGLwxeAXYq8TUpQXLqTT7g2seq8yJA5ZrciwJtSDD4
	 LjgYiOs0IQ5fifV2Ovf68shhxa9G+kjgg25nEh8r/9xVD0PQWFWXDPMRYaf/WLjsnj
	 rJm5xycoj3i3BBoS26P6H14QZGwxPRLFFDdxPEUpkjUUVewlcauZqLAoPNLrUE7Wiq
	 tmLhkaPqRgpLQ==
Subject: Re: [PATCH v5 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pawe=c5=82_Anikiel?=
 <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 upstream@semihalf.com, Marcin Wojtas <mw@semihalf.com>,
 Konrad Adamczyk <ka@semihalf.com>, Jacek Majkowski <jam@semihalf.com>,
 Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
References: <20211021151736.2096926-1-pan@semihalf.com>
 <20211021151736.2096926-2-pan@semihalf.com>
 <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <d5f80c87-9dde-fc83-8a2d-e5bb2149ef67@kernel.org>
Date: Thu, 21 Oct 2021 17:10:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 10/21/21 10:34 AM, Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 5:17 PM Paweł Anikiel <pan@semihalf.com> wrote:
>>
>> Add support for the Mercury+ AA1 module for Arria 10 SoC FPGA.
>>
>> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
>> Signed-off-by: Joanna Brozek <jbrozek@antmicro.com>
>> Signed-off-by: Mariusz Glebocki <mglebocki@antmicro.com>
>> Signed-off-by: Tomasz Gorochowik <tgorochowik@antmicro.com>
>> Signed-off-by: Maciej Mikunda <mmikunda@antmicro.com>
> 
> Thank you for the respin, looks good to me now.
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Dinh, are you planning to pick this up into your socfpga tree, or
> should I apply it directly to the soc tree this time?
> 

If you don't mind, please apply it directly to the soc tree.

Thanks,
Dinh
