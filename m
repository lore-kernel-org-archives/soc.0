Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED272C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 17:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B164E60F46
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 17:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B164E60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN+JhcB2PJwt1fLtDuWRVWm71cJPDBnjOElmsNIx2RA=; b=JGgSRcI/+DQyQ6YXq29y/nKKmQ
	3xGdpRtDPz+r1ASCQWJOLQY3oGRxrbOcuJriHDjpLHuNLIrEUNBzUlITw77+682vLzvahkp32SFGN
	o6ZOb+aUXhEQi+X4hS+V1K3j53iMf+xl303xm0Pcq5igckVae/OkaHGywJpZIRkRkVnHeBf4LdkWD
	m8oxCj850xVXa/ZtzMW75H8MeTrDZ1COeBIiyImlbbPXy6BJxWJt1L3ai9Bdgy4sj7Xte+RiqQjC3
	uGAOOmmAnCRQwZAuU7oAcXuJrWgbNn5RywLf3X8uG+zaZ0om0LDwPZyrTLoc2mLuBIAv6y5plOwed
	0ZSt8o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WEi-009fe3-Bb; Fri, 30 Jul 2021 17:23:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WEe-009fdJ-Ai
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 17:23:49 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1897B60F46;
 Fri, 30 Jul 2021 17:23:48 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1m9WEc-0023SG-2d; Fri, 30 Jul 2021 18:23:46 +0100
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 18:23:45 +0100
From: Marc Zyngier <maz@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Bert Vermeulen <bert@biot.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, Felix
 Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
In-Reply-To: <20210730174704.48c9a94f@slackpad.fritz.box>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730174704.48c9a94f@slackpad.fritz.box>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <24022638b2ba18c14731efe4f11ed8ab@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andre.przywara@arm.com, bert@biot.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, john@phrozen.org, nbd@nbd.name
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_102348_442696_218F1D6A 
X-CRM114-Status: GOOD (  13.59  )
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
Message-ID: <20210730172345.saB2J7Evcd3YeNrWEaQNN6TITJN0r7E8cx4oLUhtW8M@z>

On 2021-07-30 17:47, Andre Przywara wrote:
> On Fri, 30 Jul 2021 15:45:50 +0200
> Bert Vermeulen <bert@biot.com> wrote:
> 
>> +		compatible = "arm,gic-v3";
>> +		interrupt-controller;
>> +		#interrupt-cells = <3>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		reg = <0x09000000 0x20000>,
> 
> Mmh, 128K for the distributor, is that actually right? Is that to cover
> some GIC-500 MBI aliases? I don't think we announce this in the DT,
> though?

We do, but not this way. There is a documented binding to that effect.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
