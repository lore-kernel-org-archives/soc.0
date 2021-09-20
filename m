Return-Path: <SRS0=0B9I=OK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A007C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 12:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F57B61040
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 12:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F57B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSM+/mCqgascF7Vi0JVUIuCWAglvF2BfGV5GJ9uujC4=; b=zJuNN0NacZGKIx
	bD+v1V8vatI2whPF9Qfnj2BWESSKan38BaBpLDeOL6OqhPHB2KBtzLuVF7OEF+DeadmqQt/7Xnx1g
	NXWbmrGTYR1yB6S6djlXXwrQHUr2EFHwHCPFjeqVvDTZXEItndA8r0k/2FD+zehMZHax4dmjFViRC
	6fNrVk3ygx6OpLgORpYYbLmpfsPNDq7SsJ6iDaKTDOKXnPv+acPIMp5OntV+0sOlVGORidOfUbhEl
	HjBac6t2XmCfOvtyIksgYp+2BHy8TSzCVI3Myb9GUE1ZiqKluWaXSzEkXdgTnGzeOr550/Kor+UVT
	ue5C0eEih0k3Vt1781NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSId2-001cJX-Nk; Mon, 20 Sep 2021 12:42:36 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIcb-001cCL-6P
 for linux-arm-kernel@lists.infradead.org; Mon, 20 Sep 2021 12:42:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id b20so8604844lfv.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 20 Sep 2021 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr7++l5WuIJ3QbTb1muJLIYeQhycvVCwIfK8xwCK0lk=;
 b=nDLfjWYlYoJdQDKQVkel8PQOrJt2sQoW4MYJA3uqAsNj59p9NbFuwlUokwasgQHucu
 7VEjc4T0sqUhLEubj8xk5UHvL+XYRKgmCRaHjAM19BwHP/2fdqokZeTfQwslqKWoUEsV
 i/J0hdUos3p3PEQ84D2/iJ0VMrK5lm8I3sR66ovnlB6NZTjvch6Thb0K53KbPVEryUbb
 85gGt3QdgXVtAaF0e2wtR3HAg0XKdUJsEXkv5Z+JmETfWN1wtWCadYtAtsrqtvHey4BU
 uHiehJK1sg9Eb1puxisTNfq3wEnNDb7cbWNVUix+Z7RFZRZXwEAJEXEzDITXj/OaINZ/
 4FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr7++l5WuIJ3QbTb1muJLIYeQhycvVCwIfK8xwCK0lk=;
 b=AnziFMwme4jbFb/uwHLaDHdXuBjUCCPLmYYTnfgErx0unTwl303XvyN3IvkFgzQjM1
 JdamWLo5+srkAgTDniu1GBSFqmZ4YIJsfp3W/bJjeI4kKmlSgh8gL7oRQQzqZa5HkxKg
 f2TyjBLMig8xyUKAR7mXPIRUKebLJ3JID8jye/ttC/iEYdqK/oqG2thx/XlnCxgT3vvk
 e+i6B+bzgcixPYynIRIv/8GJ0OZc003nZ/vVvZvnk7CNXjoI3khwrk+hT7TZ99velzX5
 OJ0T8yBgHQupVxm3Ftl2LKr5oMM1OzVl+G+YI1PwO6yvnED+VfwH4Dvep4ribcksk68o
 NLnw==
X-Gm-Message-State: AOAM530bC0jHFHnVjrfg1tCn4PzCi5lPpQ1KumquNAAl2iJcjfiTX/iK
 +y/KELPtrvY8kYxWeAZ8lrEpCw==
X-Google-Smtp-Source: ABdhPJwoadCgb7r/qWWgGsAlmHH0LQz9izuJ5mTYhJpd9dpLOLSNCUkppvO6+7N7MNxy+hsNTWCTeQ==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr18180477lfr.295.1632141727145; 
 Mon, 20 Sep 2021 05:42:07 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:42:06 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 1/3] dt-bindings: mtd: spi-nor: add n25q00 schema
Date: Mon, 20 Sep 2021 14:41:39 +0200
Message-ID: <20210920124141.1166544-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_054209_290669_6DB49277 
X-CRM114-Status: GOOD (  12.31  )
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
Message-ID: <20210920124139.jQM-Tqzr63A2Hs1WHPqhhGaUuJiNYaCWKRl5YiR4iTA@z>

QWRkIHNjaGVtYSBmb3IgdGhlIG4yNXEwMCBOT1IgZmxhc2ggbWVtb3J5LgoKU2lnbmVkLW9mZi1i
eTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sCmlu
ZGV4IGVkNTkwZDdjNmUzNy4uZWZiM2M1ZTA1YzVhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbApAQCAtMTgs
NyArMTgsNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIHBhdHRl
cm46ICJeKCgoKG1pY3JvbnxzcGFuc2lvbnxzdCksKT9cCiAgICAgICAgICAgICAgIChtMjVwKDQw
fDgwfDE2fDMyfDY0fDEyOCl8XAotICAgICAgICAgICAgICBuMjVxKDMyYnwwNjR8MTI4YTExfDEy
OGExM3wyNTZhfDUxMmF8MTY0aykpKXxcCisgICAgICAgICAgICAgIG4yNXEoMDB8MzJifDA2NHwx
MjhhMTF8MTI4YTEzfDI1NmF8NTEyYXwxNjRrKSkpfFwKICAgICAgICAgICAgICAgYXRtZWwsYXQy
NWRmKDMyMWF8NjQxfDA4MWEpfFwKICAgICAgICAgICAgICAgZXZlcnNwaW4sbXIyNWgoMTB8NDB8
MTI4fDI1Nil8XAogICAgICAgICAgICAgICAobXhpY3l8bWFjcm9uaXgpLG14MjVsKDQwMDVhfDE2
MDZlfDY0MDVkfDgwMDV8MTI4MDVkfDI1NjM1ZSl8XAotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
