Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224A9C47080
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 10:05:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86B161370
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 10:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86B161370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVM3lSPKrblKBgUl96csm4zzptl0CfybeRIHObSuyoE=; b=WD/z9ou5dB7AVd
	UHRsiQCTaDkxwjMZkfIl9bEvOJDnvoFVyhJpOikmgyqPtF9SHYK2hTKH6n0EoH0BaxcTBAZknIPt8
	mIdbirJp3kGfUWGEWBKdz6IsCjRII7X2WiJ3gDvqnY1Z7rw4Iw+js5B5RRnc0duvpLa+2q/9H1SWp
	9tcdfi8iawKAG17eLbP1NoYAN74SUQauX8h6/oEs9WObgQO/bZZAPixnOznx6MgBgnP7u1nqH4JpM
	kYwg9BoI2mdmnNzFPXPTA/EYBN+3rKX26Hqyk3dU2Ja2arbZ78i+BvQoIq+cI8jJXziLiCnGdDXku
	RDYDvshqEtzkcYAgakbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo1Ff-00FmV4-1Z; Tue, 01 Jun 2021 10:03:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo1Fb-00FmUC-FZ; Tue, 01 Jun 2021 10:03:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E86AA61370;
 Tue,  1 Jun 2021 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622541835;
 bh=nzp7+OLvTqxKzfdH+odNOIhMHeiYs5RPeVqw/4YtOgg=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=CBwhGs6QaPBgbk+wJcfLJCbLp/i4tGZM/PX/+Hk9LLmGMBBMkqn3tK0bipRWf44jV
 nJZ5EBXFVhACQOPV5SanJAhgoYr9+N801DNZL/OMvLVnmqcPaDFSkQOkyUEOcnOiof
 GgxnjUurTRmPgjkY48iVTuT7Lpm9l3DD5m5enl0cUPOTHWGDVAQX5sh31oUsTAnAIQ
 0HyaQSMQO4hIL3B7tHWCQLevWTUioz6CkGzrw8ND5ODcPSeleH9rHxX9JBhIe/r+mC
 6LXq4Ix0k3lOqX3u3txBqzIXcVcD/B/CzzqhmyU2vZ1aPZav783K0nifg+0wKwHluR
 fiPWVrpkIQfow==
Message-ID: <3f50f07c276798ba7702f3742d06866de53f6a67.camel@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to
 DT schema
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
Date: Tue, 01 Jun 2021 12:03:49 +0200
In-Reply-To: <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_030355_569036_57A04FEA 
X-CRM114-Status: UNSURE (   5.91  )
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
Message-ID: <20210601100349.Q6bXN180QutqYzk3FgGQFNhEz9wPqnuFD9kzizo2beE@z>

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
