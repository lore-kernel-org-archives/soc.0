Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60977C48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 21:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D98161279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 21:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D98161279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9U2r9iea9CIMVb3AQ86ffpd3UURteBcGULsZeT22yc=; b=M5wAhL5f7LBnwf
	cWFfZN2L7dSeajxpKAjmqdEleMTrpixNRU3Pbizo9NXRweF4wtYD0tLaw2UpcQq7NF5J18sh6z2HR
	8EFAF++aJJRjgbxFBbXSQwZJIZk+NKkRimk3LZMkK4ffCrg96sKId6sBlfdzRgxsExjNhpvujVPq2
	cYgtfeY/h7O15Vgr76oFtAWvheOWXRYuJlaO+GDF9XhmfGbG5D7DeiNg1JzXgn8danIpfaWNKt2st
	wxxZ/9btbdI/417VPJzaFWTaSObKXZrKaYq4ITuyOYHxiyYl6t4+sZWXOERE1SSawVSlK+Hs72gxh
	N1NM8mcbkyQsa7204f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLh3-00FXNZ-Gh; Fri, 18 Jun 2021 21:06:25 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLgz-00FXMk-Or
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 21:06:23 +0000
Received: by mail-oi1-f170.google.com with SMTP id m137so11987383oig.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F22AKDNL3d07Kxi7bAvLGrzvtDt3Ggs0m0nDR4Vfnrk=;
 b=N07zGwuouV2CtD5sh35xnmv4TqB6kaQpHGcxDNxrCFOm3XgYmPwbhdBjLcFbKnYIoZ
 AQXexE4qhnGMjqcuxKnqcIob4iof1i6/6Wsvra2HY1q67RFY02w7ulL7oJdpTG9AZzBf
 pPhIHwrtcjl6jH1Eq3GqfIksSDeHsDdGuN7du6F5VPo4KpFQZQU/i9HA7HUFrjqtt6gF
 Q+/PjR6V8szI9K92BGe1XpbHYWWMhlDAEpbi17c8z4vF0hYSsG5ZTWT2UE0hpAp/qcP4
 oOqy/ljt/qhxCz+qQE7mbPBP/wSSmftSVaPptRXczndkEoY0oWLW0fbNMF7CHnvRL9oi
 Z/2Q==
X-Gm-Message-State: AOAM530qGhJdzblOrxMwu+oiaYuGpeKHb+ypsg2j3P5rptVWQeuLkVVU
 sZRX/erG4M/GaiikR5Zm1A==
X-Google-Smtp-Source: ABdhPJxJZLUHgtZu7sTq3PAbrobAWO/1QnPSMepIbgPrF28rW+Vr/C9MDt7TspFK7/RwnzNGmtYu0A==
X-Received: by 2002:a54:400c:: with SMTP id x12mr15730026oie.89.1624050380272; 
 Fri, 18 Jun 2021 14:06:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t3sm1647263oic.48.2021.06.18.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:06:19 -0700 (PDT)
Received: (nullmailer pid 2873797 invoked by uid 1000);
 Fri, 18 Jun 2021 21:06:13 -0000
Date: Fri, 18 Jun 2021 15:06:13 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <20210618210613.GA2873750@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-2-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_140621_856404_389826F6 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210618210613._GcObfy3LfWQxn3zjmUJyy9chQHVxcbDdd1GihW4S_0@z>

T24gV2VkLCAwOSBKdW4gMjAyMSAxNDoxMDo0NyArMDIwMCwgT2xla3NpaiBSZW1wZWwgd3JvdGU6
Cj4gQWRkIExvZ2ljdGVjaG5vIGFuZCBNdWx0aS1Jbm5vIHBhbmVsczoKPiAtIExvZ2ljIFRlY2hu
b2xvZ2llcyBMVFREODAweDQ4MCBMMlJUIDciIDgwMHg0ODAgVEZUIFJlc2lzdGl2ZSBUb3VjaCBN
b2R1bGUKPiAtIExvZ2ljIFRlY2hub2xvZ2llcyBMVFREODAwNDgwMDcwLUw2V0gtUlQgN+KAnSA4
MDB4NDgwIFRGVCBSZXNpc3RpdmUgVG91Y2ggTW9kdWxlCj4gLSBNdWx0aS1Jbm5vIFRlY2hub2xv
Z3kgQ28uLEx0ZCBNSTEwMTBBSVQtMUNQIDEwLjEiIDEyODB4ODAwIExWRFMgSVBTIENhcCBUb3Vj
aCBNb2QuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaiBSZW1wZWwgPG8ucmVtcGVsQHBlbmd1
dHJvbml4LmRlPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3BhbmVsLXNpbXBsZS55YW1sICAgICB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPiAKCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
