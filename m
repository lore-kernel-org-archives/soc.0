Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2601BC433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 06:32:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB88A613B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 06:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB88A613B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nn3IwNVwQYzKNuA/RnVhnt8zBqSRUU7SWRlH8taTm9s=; b=NCBpKZNM6nz18GF0MgGcmiiOw
	CWZJkVpCQTeApMbDLjZfErn0Pvu9p4n0E6McU9bS6I1SLNwONQ9Uf5aQ/nAE2OH2v6mcxca0q6nvR
	ty+dQj+i09tzWrx3dxMshGOCkMq5F8JisFQZ/grB8Ol+a49G4rcNE6Vfc8+TDcZFy97gjU0qAbZ9g
	P3pLoQZ/c//AJj5nYxWpQe4VvVEtCxNAKXS41nxYYahFdwREOG02AzknVVp66yBia16QJ3wEe2mRa
	SuG89jw+v5g2WgfzeAhrLtWsQ60Au6mQRoSwzjlKNlS+BUzKOCa7yD/X413yHxXEygnGjxCAfD3Cl
	KYAdfr7oA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ6Pd-00Do4m-VV; Wed, 21 Apr 2021 06:32:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ6Pa-00Do4W-4C
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 06:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=myo3+/Q9DOAMfM5xrUu2iVreKWlbYPjuCyEepjLnQuE=; b=F+s5KiM9xYb/Q9c1+vk3StiiVn
 dhyiaLgb5YvyotrUms3XC5LqVicSnXkG/TlCJLtz30QrJZrtqHfwJrsGyw7FNDZlGq0fCIaNmx5K1
 1uZho7FSNUqUoe3IaEn2rMPDUQAgx99KkDg5Kx7GNgMJi5mkKCASRJeZcwd8q905FYS0XJ7dmre25
 /6dgXQY+47mZwl5sxQYzpu/8fCC1LwM/m2bFYTdOCB7POiLFlyP6cT8YxAnqoJElF8aQDsQ0C9DtY
 HXxNLTNJcXgJwS4RqBn0yusbcN/1tT7IRc8Fgm4M4nMTX/KQj8VCkuf3nB8kU51Go57hY5vq39HMU
 QVL88ZvQ==;
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ6PW-00CdyK-J1
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 06:32:32 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9MlI-1lcF4x1cQO-015MlB for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr
 2021 08:32:27 +0200
Received: by mail-wr1-f54.google.com with SMTP id w4so36336731wrt.5
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Apr 2021 23:32:27 -0700 (PDT)
X-Gm-Message-State: AOAM5301bmrhviZ9OPf7l5h+HfyMtGKXRP588ATGzHCTDSwAIjHPPWL8
 NT64pOrE4V0D1ug2UPku5/yw5Veg2+cm3bi7TK4=
X-Google-Smtp-Source: ABdhPJz8KQSQMuG/h3FrLd/30pB27ABNbzxI+tJP3O1/oI7h1c5S/4lxz8O5iRBe9dLjnXhf6FKlZ1EzgS+Z6bRkkoQ=
X-Received: by 2002:adf:e483:: with SMTP id i3mr25900890wrm.286.1618986747076; 
 Tue, 20 Apr 2021 23:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210420230402.8807-1-khilman@baylibre.com>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 21 Apr 2021 08:32:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2bJL732XttLnjRH_1TA3EpuVaPyBDD0NbhbCO0WmqcNw@mail.gmail.com>
Message-ID: <CAK8P3a2bJL732XttLnjRH_1TA3EpuVaPyBDD0NbhbCO0WmqcNw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>
X-Provags-ID: V03:K1:VayMfYcF7Aip0jl2vVx7EP8PfFl6P5fG5f2tBl/llQQ3L6m7URS
 tXBIh7i02uaKDSbeQIgmHw0MzRJgWxzB0qhr5stCN2M/myIelbD5pUBBdgRkl8oQIAea+EC
 HeuZ6Ema+rlYEvUZj4azBs8RFBz2nwhGOLgiQsZT+Bk8eUeQkARixAot7lEvyK3he83O3LI
 doCDmPTorf8DUUE5XR0sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N1pBbnxpOa0=:a1rryM0DGKC5mA2UlKPcNI
 ZWvP8abJPxxSP3OPwH4xuc4gaEcky3arT1NppmqmuS+eGhxzjPaI73IgznYALIRhy+ecRG6j7
 XPk2k331RhCzbRnoozdPXNDwXuleV1AyWP4WcytaEBwngx66CDwZJ/rXArKpQgwd+QNGMRbN7
 GRi94RLx559ZvjM/LbJfFC6s1nBq5rxitQkOb7U9BZeA4ALZr0cZWAWohYSacWagNs/V6mAmJ
 SSiUENhfn/SZwSfKon86dQ2faDNAl2JB9XjKnA65JyKXgGUyK0fZmNy9/BaH5wIEiU/O179Vi
 9qCcpm3pr5TZr/FeA1vxfERnnHw5Mjzn6t1NNGvzMEAwLlU5K1Acnykv7QXMv/4whrMeBJ1yb
 OiUTJ8S94V82aGRqeXTziWrYSzNsPVSu+L7gdZNhW0QPW88iQf862cxTOblj4G0aMz6r6QxB7
 pGS0LW8QJ/MF2CcRNkyOIAoMbrOBZPpOsV+W10wvcbV4cDYY4Mu91b/xX3RfA9r1Lsn7ZI+f6
 9KQ/rmGj6eNRbAqswplBZI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_233230_936830_739FB066 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421063209.8BmatfvG6ft09MPlpVg0sUYPMB3w2OtYX8DCCexPGXg@z>

On Wed, Apr 21, 2021 at 1:04 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Thank you for addressing these. If Rob or someone else can review them
and confirm that they all look good, I'll apply them on top of the branch
I already have for 5.13.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
