Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D133C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 15:16:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99931239EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 15:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99931239EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qC+JSs0TZUokjGhYCtoE7YOoRgDXg1Xd482Wg1vIr3E=; b=1jMq5ge3uSFRgL+JvpZFjAN9m
	vhxYNhDDywqYzeiosy0mZx9WU0PnQDHMMvA4/xAyUuQRSKCc9CK+m28iB9a3x+Jc73V62zHXmHe+j
	qRs01Sye8tdJDlsYe+TrdiK8Oz4m94l/8yrjA8QOXa+A2mFawJDPiE+W8mX9/+lNnoKpdu4LCvRPa
	IIL2XLOAWR6troy5Yz5BlfdS5vswGye17shIDxmAz+kQviXlArWpElCozkvnXpujA5GlNl56Pxf4z
	2c83495oT/B4RJ/uboQO41mpMDaj2PQBz9RZQLJ1+PPs+a96ixGbxTPYDVTBhdYH8uV7jfA20Q2J6
	ron3L9I5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2bfs-0004iO-Cf; Thu, 21 Jan 2021 15:15:04 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2bfm-0004gz-L3
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 15:15:01 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AD5FD22F99;
 Thu, 21 Jan 2021 16:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611242092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCqhHiLG+HIy/KpgWMep43uHSdTreIHEy2UEo+8BPmQ=;
 b=HNjygoJezksRVrvq/4vj1sKQDQb5mPiv2rc55WUhpe3aopQ7M2LIyyuEPBUtf9o03Zl113
 ma8PB8ark1Pj8VS9ssD5D8gx0rIK3rVUkV83Aqzl/lPBfBF8KGHwKC+ZlgMxM6GkFwpo+/
 IOYx1Od4kLHNbdITzw+8WcWLZ9lTJNU=
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 16:14:52 +0100
From: Michael Walle <michael@walle.cc>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
In-Reply-To: <cbfc4899-eb92-938a-95f2-23ca9485beaf@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
 <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
 <bd86194a13882ce472764d0c91029e33@walle.cc>
 <8917c9a1-09e9-0a39-5732-da7f555ae9ad@xilinx.com>
 <df072e37bb6f3500d713be565cfa1328@walle.cc>
 <cbfc4899-eb92-938a-95f2-23ca9485beaf@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <a346e761397a14d2effd4806e53395e5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_101459_121471_E65D1BC4 
X-CRM114-Status: GOOD (  18.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121151452.IACaTgdKjpp8XwTrZ3pa593Mp6IwT_0ZyLQvzwK3tiE@z>

Am 2021-01-21 14:16, schrieb Michal Simek:
> On 1/21/21 11:41 AM, Michael Walle wrote:
>> Am 2021-01-21 11:23, schrieb Michal Simek:
>>>>> Back to your case. Board is cheap which is not all the time case 
>>>>> for
>>>>> any
>>>>> xilinx board but you have only uart, sd and partially described
>>>>> ethernet
>>>>> which doesn't work without PL. Is it worth to have this described?
>>>> 
>>>> I got your point. But it is at least a jump start for the users if 
>>>> that
>>>> board boots out of the box. And yes, its unfortunate, that ethernet
>>>> just works if the PL is configured. This is already done by the
>>>> bootloader, because there I do have the same problem.
>>> 
>>> Zynq/ZynqMP boards can use U-Boot SPL. "Advantage" of this solution
>>> especially for Zynq is that in u-boot there is open a way for adding
>>> ps7_init file which is determined by device tree name.
>>> I think it would make sense to add these DTs and also ps7_init to 
>>> U-Boot
>>> project and wire it up with zynq_virt platform and then you can boot
>>> Linux with using U-Boot's DT pointed by $fdtcontroladdr.
>>> Then you will get support from scratch to be able to boot.
>> 
>> I already have patches for u-boot (using SPL). But my impression was
>> that linux is the master for the device trees. Esp. if there are some
>> problems with the board its often useful to have an in-tree device
>> tree.
>> 
>> What is the difference between this board and the other zynq boards
>> in the kernel?
>> 
>> In any case, please make this decision now: will you accept this
>> device tree or not?
> 
> If you promise to regularly test it I am fine with it.

I might even integrate it into our lava lab.

-michael

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
