Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDCCC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 02:34:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00E964E99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 02:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00E964E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L8UxT4QTluNoIUAeAM2FG/alYfWWh0hjU8TDR7Z/0wY=; b=RhcFkXlWlHCMrWKEOw5MNvYGN
	jEjm+VUJJV15BN4Nf8Hqx8Zc0Aqn6rKGyOTCrKtpYfs6Uc7k5Ja1JFBvUA/jGoCTgYkQ0qnkGcVCF
	yfkNH3h9sPcU4f6/asgUNYkiFzL3Ko1DbOFjbTeew2yoAza+O490DNlZKQ9THWr6Wpm69ZGYdrbLQ
	CQLtBxeGkyh6qmSYq18SW2QclABKsiG5Xe5iB92+pip9ym/wRuqnhXpTO4aZsorPhrYxRq+4cRkoY
	BdTkLXbONYl0pwmV6dwWkqNrnO4RnL3aY3lFcNRTcVUVkwfBO6rs9pm1gw8nBMbvOvRxy5uKG/k2l
	41sjPmZqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Ipj-0002Fv-UG; Tue, 09 Feb 2021 02:32:56 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ipg-0002Ew-UK
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 02:32:53 +0000
Received: by mail-oi1-f170.google.com with SMTP id y199so15894704oia.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 18:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YP9H2kzr/vTSeYjwcofC7D1lobSyVWitvsOWLEGknl4=;
 b=N3G3WjfGdszRh2DmKHruPaViONfdKuglLv44VZGw8KoNnIwfY5SKCjVd3B8XUKSxEw
 eaOWh/hAoMdU4p371aT8lOBMpxaaHDugqMOU3sZzfZOmFDjvUFhsMl3KjaiCurUIfLVA
 t5F/fs5qIpt6VH0PntJbrrEsN0EvwbVCBLY5U4OLa7/y5LW8ekdHqH3DWnbrrI0m/5rl
 Wzyy+B97YoSgWBLCIRijFZBRemgQ0cPNtXbxbb65I5VMD0cIQO6MB2DmQ3FBpabP7rdl
 0KwGQcFWOxKNBdYhK7mszSNaj2RVfm0MkS/AjkAY5CcBk49V8+FwjnwOJwmn8WUbkbJZ
 AoFw==
X-Gm-Message-State: AOAM532xUft0YwmRWM4uwCXbVLgBAz4O7digtst/KfY1hgW/ixWmleli
 28pQPleCSewZ+ZN/wdMShg==
X-Google-Smtp-Source: ABdhPJwTjedOokuNw7WiMMGvYnGm7XHgCJ9N26N5tqJrfhaqNtdCHzRKUaXFrJkQzGWJc6jjHzsyUQ==
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr1070281oiw.27.1612837972353; 
 Mon, 08 Feb 2021 18:32:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r4sm1984751oig.52.2021.02.08.18.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 18:32:51 -0800 (PST)
Received: (nullmailer pid 2561689 invoked by uid 1000);
 Tue, 09 Feb 2021 02:32:50 -0000
Date: Mon, 8 Feb 2021 20:32:50 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] dt-bindings: add ebang vendor prefix
Message-ID: <20210209023250.GA2561635@robh.at.kernel.org>
References: <20210120194033.26970-1-michael@walle.cc>
 <20210120194033.26970-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120194033.26970-2-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_213253_007735_CBA88515 
X-CRM114-Status: GOOD (  12.60  )
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
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209023250.hST2zfn5WnOhdZfVXBwRjxt8kDY0nZXKu2ClPo7fbnM@z>

On Wed, 20 Jan 2021 20:40:31 +0100, Michael Walle wrote:
> Add vendor prefix for Zhejiang Ebang Communication Co., Ltd.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
