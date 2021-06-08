Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB18C47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 21:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93DD6139A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 21:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A93DD6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeNqbvE56mFNZ6QeAXCS4SZjGQLXKsEXruP6ulDBJw0=; b=D7ehWO3ZOjTg7h
	AH5w6eSe35nJgNCF9xQaR4mNsLUMP8D99ipsEHNCpkuxQLvaJi/gbKIXkIN2+Zxw9eoF3wl71yXmD
	Iw7zO5pK+mfnBAGcfaCsOJyoJwqQM8r/eLOaDQAOS+cJ07E7RLdlvGslsHpa6fDDGb+YTG7Ot82kJ
	xcJtORO3K3B3LY5sAV5an15ST3t+1yL9Z+yOWrSdZlopoCJBOaEAgTzTMXfJ0LkAvhcYZWbUVbLsR
	sAaenvZ2f9pihogA9PO9Cn40gwm0a2Ox9xOwwe1zyZnZP/Xhm172gIKnp2vPdl2kQQ+ptpHSOXq28
	5BHxLV7KL9HL9wN2q9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqjW8-00AZgk-UN; Tue, 08 Jun 2021 21:44:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqjVw-00AZfF-O2; Tue, 08 Jun 2021 21:44:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4CE46124B;
 Tue,  8 Jun 2021 21:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623188640;
 bh=DJHRGZItfqE1QvRxRO7816Y6H4I/ua4sDP85xNsGshw=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=cKnyK3rZKiYxWOSBi5nL0Eo4YiLXhr8N9TizRAqfNqM1vKL25Iwk56Jik3wdKgWom
 xUIrkaoKZ8GrCIThjRrNUqi69cNBBCf9x6xAcQI3Wwv4Wzkjz40+kfLG/CC5FYSHZn
 VIXBm8W6ZxYvdXUi39HpAsyLH5HZpRzg6rsNpYHQrblEig47bd5EmJUi6wf/yA32ug
 puQks3judst/njzxD6P1LtFlD5df2s9FsrhRqoj8h1IfC2v+6hQannbulPeWHWUmAM
 PJTQbwuU9uWZSBisvlkO6pRvXQOSAW582aOOkJxO/rkklkcsjxTRRqKm91KcxVIK+e
 00ZU5+oKEAKZw==
Message-ID: <26d44aba13411e69176356d619bf4993719c8bfb.camel@kernel.org>
Subject: Re: [PATCH V2 4/7] dt-bindings: arm: bcm2835: Add Raspberry Pi 400
 to DT schema
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 08 Jun 2021 23:43:54 +0200
In-Reply-To: <1622981777-5023-5-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-5-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_144400_833304_67282FD4 
X-CRM114-Status: UNSURE (   5.83  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210608214354.A3Ovn_WqV65jq24KVNbwMupaePbI_6cVqvOM6zR-9mc@z>

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied for next.

Regards,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
