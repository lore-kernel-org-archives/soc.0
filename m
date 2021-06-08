Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F328DC47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B64CC610C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B64CC610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFlEBM+Q/fYiZTJmgdhafJz0hppgWihC4lLZE/iK2xY=; b=zQ583aXou60gCL
	NHxTgWecUxRcouLvpbJhM1Zf3+65xZr0SRXibk15ojpZl+nn7Fhvt/EN548ZbfM4tc12Pmdhs4c3n
	IFD7JwWJO73TNdU1o7vAt2COiuKv/pWBQAOcOyTRO/4gASfisdWA6dd4YlH7XaGZWpFMd+w43CYSe
	caqube3JOWZm24J8hqWi2NvHhV07OqFJNSaukUXcryEeO3QTmf5ZuTsC0dL353YcQJa6qczxAwdZW
	zOWBHmAyZHTYBNdzOEv7ha8a2JnanyIjSF4HlqLjaY5tAFSaGZlxMdjWge3KrNnfP8u/jQHQt6Ayp
	TeOdf3qb3SfcW7q5gQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYfL-007cCP-RM; Tue, 08 Jun 2021 10:09:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYfH-007cAr-5G; Tue, 08 Jun 2021 10:08:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBD43610C7;
 Tue,  8 Jun 2021 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623146934;
 bh=sHlA+ACcUVq/vMizcuxob+sYrkGaRg/uGni6rq6akY0=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=J4mzUTfnMX3RKMvkHi/yt8DXqtdTXXN3DZLptA+Jys8ahVipB8TXhCYzYo6bhJVNu
 yae1fSxI/qyW8VotCHd7Zt2DXk2Uv0BbYMf7gw8rvPaq5VvjQ6pct1kTF99ny8dMON
 N1MD3XmT52c43NTv1rBSDSEsqBGwZ8bxL1JL0SJ4NwI1nBH114cN0fzbtmvo1eKDEV
 b7Y0Q3kBEbPsRmZaPah8nXhl90avUeG/wbTupThMnofv2RNgbsCFYPklFe3XgkiBJD
 npnnrxEBXpqHYOMki66p2c1Wp1nEtBpO2LZgXds2t4l62o/vDTuInbfclzIgm0mRCr
 /dGQKRMVArfsg==
Message-ID: <e74b54347fa63b9bee7b2f89c42b9243d009576f.camel@kernel.org>
Subject: Re: [PATCH V2 6/7] ARM: dts: Add Raspberry Pi 400 support
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
Date: Tue, 08 Jun 2021 12:08:49 +0200
In-Reply-To: <1622981777-5023-7-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-7-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_030855_247448_1B6A638B 
X-CRM114-Status: UNSURE (   7.66  )
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
Message-ID: <20210608100849.QMdngJU9CGsBWO6EDxoG2bZnxLEAtqHLN2OiZIq0f4Y@z>

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> The Raspberry Pi 400 is like a Pi 4 B designed into a keyboard. But there
> are some minor differences:
> 
> - higher CPU clock rate (1.8 GHz)
> - different Wifi chip (BCM43456)
> - power off is now handled via GPIO
> - no ACT LED
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied for next.

Regards,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
