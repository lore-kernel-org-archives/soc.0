Return-Path: <SRS0=Pxxr=K6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD19C4743C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jun 2021 21:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC37611CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jun 2021 21:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC37611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMzHXvhJeUCY9l7ursd94PjquFpc4y+TWuDAShRn2JM=; b=XA8N6WdB4fxTYf
	2cVT34vI1aUA141E6/OWNjen6Yu5LykuRpeALNCgIN75hNxulUUBvVyPZXUy/vmG41RmSvJjoM5Gj
	WaZI/s6tqnpSS9d3bdDA4SJIh6voyxy2h66x67SrxKmHQxr+Cfn55O/8g33FziJ7YerQ/sUzZxRHi
	EUgs/hOqBIcISO+E7p1YDaGCxhNSJYJPVzWEDtoLhQKXVYrDg5qDJd0dbSKgbCbiDUGvxxGLXgHQe
	orZzW+UkBgQUS/D82Yk0hn0PqWwejCxcRwcXqw1apih4BY6OkJR0kjL7sLTa9x02tMxCKDIiFSh2g
	Nm2L7miGzJs2zTFTIaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpHPO-00FJIf-1A; Fri, 04 Jun 2021 21:31:14 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpHPK-00FJHr-A8; Fri, 04 Jun 2021 21:31:11 +0000
Received: by mail-oi1-f178.google.com with SMTP id d21so11104975oic.11;
 Fri, 04 Jun 2021 14:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G8/6uPjm9zIO07Og3jk4Blee6TytpfNx97cozFtQkXk=;
 b=FGFjl+mjrx/kX7wowc9zdufXsXboSOZqhVEqeWcu6ZWtqF5r+GzzYJXJe9nSseyl5F
 1OGua2ywemHgoe+TKTO8afRympy/L55VrjFKID2lFa6j1uoOpvQ4wXiwyypEmP6J0cjl
 KUykMNWnYuatISuTyVFNWentMurlZ2eGZjfmz2PmQ6HeHhFXCSPK2e8YW7OXBR+5Bv7S
 /rBE/eG9NZpIqTgySr+4W6ItMl07eqqRMm+jYFwooy33f951CdjOOTwEHHUTwEYm6LWp
 SgsDDqog7o499chIe1E/p7USpo4BdmRuLQQ5XgAhQ5+EVJouJOWUiabgsDermYToZNXp
 jZ1A==
X-Gm-Message-State: AOAM530VXxM4dqLmiD5pqYBfoZN4hExxhw0hDSETtAkOjT4kPlxDlc2+
 ZaHEHbXO8aqUTntx17R5kg==
X-Google-Smtp-Source: ABdhPJwt9RTOBE4geRHCniJZTQYsmuFJN2nxYT9C6QTFn0LP/lZgvq3IYcVDxInRaeGmlUib3nIgRQ==
X-Received: by 2002:aca:32d5:: with SMTP id y204mr4299396oiy.97.1622842265997; 
 Fri, 04 Jun 2021 14:31:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p25sm667895ood.4.2021.06.04.14.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 14:31:05 -0700 (PDT)
Received: (nullmailer pid 3955311 invoked by uid 1000);
 Fri, 04 Jun 2021 21:31:04 -0000
Date: Fri, 4 Jun 2021 16:31:04 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 soc@kernel.org, Scott Branden <sbranden@broadcom.com>,
 Olof Johansson <olof@lixom.net>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to
 DT schema
Message-ID: <20210604213104.GA3955259@robh.at.kernel.org>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_143110_375899_28F70A5E 
X-CRM114-Status: UNSURE (   9.02  )
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
Message-ID: <20210604213104.tflD6AfY5b-yvLy9Djl6KVwWqA_TQzDnVkC6S6Vvrog@z>

On Sun, 30 May 2021 11:26:13 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
