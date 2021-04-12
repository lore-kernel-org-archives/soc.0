Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B00C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 11:44:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3BAE6102A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 11:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3BAE6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Dl+uprMfX2B83D6shSdWPBc6jMpgk2sjedjlIQXqGA=; b=HhUvkbsPjJlJcFXxzm0lqUhTu
	2NqdpvYKjJlA30Xay47XOEGMcKxa8fHzkDhPSQWUkMRodqTTt+4nIWfzEmyAJYpGruT9uMvZgjhvD
	NANqeDALGpN4XFXm0N59bYKsPWFQkIlm8z6dk+dpy3N1lbRMkUFRUqOgUmMBpPjx3ELKdBSYRrKcF
	PL3CSUXQglWGV+QsPnxrOa8ReMVS7xHXerLyhRbzZG2Pr+aa0j1LeoYGKUuToTcAufP0jA6qi7j7P
	+Cg6ojFrRSdYR0p3jlE+uBkrTlx2fbrqkN2XGOkJ2Amqf3xIHBtys0LO5bp9vWhTMm/6a53ryHEVw
	KhGmr5H/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVuy6-006asg-CD; Mon, 12 Apr 2021 11:43:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuy2-006aru-Pq
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 11:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ypymNdpi4dAVgsnxL6Ur50lfN32NCzonw+y3XZGZqA0=; b=WKR9zirk5u+SIldvY5Jd33RhuM
 SIGLC7lAaOgMAi3WVbC0jsrar1dQQ8QCv1EJvcnzg4ZrZCI+I3P2JHaudP2qcbjn0qkILvsXX4po6
 mgkaSkaxEyi1X7JZ65w93DpnFNrVpMlcjUOhnM/Sk4dQbmIEr0xq+fS4cUo5s+6tAuonGRt8D5dzD
 SvbhSB+wtag7iOS9dUzBue7ObLTd9PxBYN3jlh0+rLgC+907PcYAM+jC3vNATJHsNv7JWCyqqTyak
 EkQKHfZuALfkkdQopjPwVe6lNtbBW3WV+pZK+QQG5kug+L7YYAVpcbLTr+mK9ImRFKZ/NSNVNsejN
 5XiT435Q==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuxz-006Bfm-Ny
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 11:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618227775; x=1649763775;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=54pILV5Cfgxhme73gcj3lgSwJw+HJPBn75ACjnoOkpU=;
 b=SlnXMzjAnGqZy4DrXabHRIBksvDTYwTfDvAqMkwTkS2pwxlfNvsYJBFO
 w1MEQdpjjfKijeVL+MqIDBdYynLdUQw0eyakui7VnJpdX8WyhhmnSYQ4k
 TT65ff4eYjVjxyV4SUakmLI1uzQYzM5q2Lj34eQCjoo33UX1NiuO83Kvj
 9kZf6WnCpPNLeDIv8JNfMwX1u2tEzSk73yGGzF8RpnwppRZaOENnjQ/ot
 GqXm+fUl/hVxb3UAaw2eDW1Bg4t8ERT0Pstsds4+EiIE152LFo8rvKG0t
 b0Lw44LuKYRoqK2p3vg4wm5bsNQaaFUXqkub7cy8MwfXm2w5zIZ0rD7d7 w==;
IronPort-SDR: C8vMucpo8S4CK2NqOlqonvByif3iX4/w9nA/jdFAewPDUR+tnUL9G3vc10SDzd2KqeR9NAN0+Q
 LniS8yzKsBUX9H+vmTcFxehbk6ggKEMYcxy5OuDkIM4silNE91SHQPe00D4D2xAunDg44oY7HG
 mKhWRmrfTegzHwaI75IWwWkQpmNm8+jlYsfCXJCrWDmj6uSNn/itQOcYX/diJJoNBK7Y/Wzj5R
 tw6nHfDAQAh2D7XDXnEqSU/iqEocGgA6Y0kEAvHn8Re3k1t+dIfeRTfNePhM7QaUWsjwBRlK6n
 ARI=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; d="scan'208";a="113260732"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2021 04:42:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 04:42:51 -0700
Received: from [10.12.72.197] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 12 Apr 2021 04:42:49 -0700
Subject: Re: [GIT PULL] ARM: at91: dt for 5.13
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, arm-soc
 <arm@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Linux Kernel list
 <linux-kernel@vger.kernel.org>
References: <20210407114415.13180-1-nicolas.ferre@microchip.com>
 <161789493817.1630479.5024717274217057698.b4-ty@arndb.de>
 <71b2bd27-0d3b-3331-4f79-85b22594e20b@microchip.com>
 <CAK8P3a1dyccHquEoSv4kECw-=RKNQAFVQap-DYTX-sDfwEPTGQ@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <6968a992-c3d5-eb56-ec71-1908e7be6ca3@microchip.com>
Date: Mon, 12 Apr 2021 13:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1dyccHquEoSv4kECw-=RKNQAFVQap-DYTX-sDfwEPTGQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_044255_874630_4AC0CD0A 
X-CRM114-Status: GOOD (  16.37  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210412114248.4m0Tb936uXOUCAW8M7GBRfeWY7s-npR2i4DGnDeMEDI@z>

Arnd,

On 08/04/2021 at 22:15, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 6:35 PM Nicolas Ferre
> <nicolas.ferre@microchip.com> wrote:
>> On 08/04/2021 at 17:24, Arnd Bergmann wrote:
>> Oh, got it: it's the upper case letter withing the etm hex address. I
>> used this one to mach what was done in the reg property. I'm fixing both
>> of them and sending the patch to the ml right now.
> 
> Ok
> 
>> Tell me if I add it to a subsequent pull-request or if you prefer to
>> take it the soonest in order to not generate additional warnings upstream.
> 
> I'd like to have it before the merge window, but don't bother making it
> an additional pull request if you already plan for another pull request with
> 5.13 material.

I don't plan to make another PR on DT for 5.13 so I would like you to 
take it as a patch.
https://lore.kernel.org/linux-arm-kernel/20210408164443.38941-1-nicolas.ferre@microchip.com/

Thanks for your help. Best regards,
   Nicolas


-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
