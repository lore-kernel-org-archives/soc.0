Return-Path: <SRS0=LG8l=PH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDECFC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92186610A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92186610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUzySwx1++HFEkuXWvhVq3bClRYTlXtTf/mO4rSzXVQ=; b=YA238GQbCsCBMk
	PxRTFDmE/TrEdix/oLLMzxLATvQElA/c/zlhh0DV+WfN0Sams4Lb0srvEFalVmqlTRCEofWfetSuq
	+z8kknpZkDko2JlbEI/TZi5058FqE7N+weszGIT6pylFqzJl8xyt6YMiaK0CKKHFViia6UtOJ6u87
	DGZT0SnTdtuCb51YDKIcmJVsaKY13Oa4OaLnBvgR65QYMN7Ra7X6f1LsqNYf1ksA9B/OAG1ebego2
	vAvu30IvXSFqZ0QqPNzIjz1RqEhBe+UtWMBroDQnGDNqRiI1nRBrxL2nOAqH6L2ho0WD+dj07n/ZL
	7xzz4j/7E4/X18AMdZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcps2-001VHi-UL; Tue, 19 Oct 2021 14:13:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcprk-001VDb-IK
 for linux-arm-kernel@lists.infradead.org; Tue, 19 Oct 2021 14:13:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id x192so7713886lff.12
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 19 Oct 2021 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BJi+ZlCn+9t1HmHLAVFKllNO+of8NwzGF9ts4wWRjYI=;
 b=uuEyWPS/pV79truckMUZ1bI8r+5W4r04spqHtTD51i5L+be77tLsEh+C2U90tm7Dy7
 JBSolHXmUv4KVltKltkkmrBlawCoduIFFRhVtxkVP5LXJw/hAvLZUoPEoXovnLJiD3aR
 fgR5loldfgjbAW2NPC5J7E2Pty0BCMBHBMseE4StIwa+HIrtLr52muBY1fuB39F+4rFv
 fwxCJWFinMXUooXAIOB2qam3KjwXeArruF5fncaYVGRTwEpIcY9U18h4EyQDjEUXF9mC
 yqOdNA0EiFfSTY4J4Rt8xUXtRKTMbnDRWFa+F9k4Q+io7zWI9UClRyDGPW8W6g4rpRQv
 jTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJi+ZlCn+9t1HmHLAVFKllNO+of8NwzGF9ts4wWRjYI=;
 b=GcAw5tt/v+tfK/ZYBbc+Uta/9LJeGeRAm+4DOq/IPKrr/fvu3A2M2s6FnCN/avPACU
 KMXcG1InGdbdj9CzqqW7EksrWgzbjty73kLvqPgQEBCOA3ivc5CPW+Gk72q42fl58ul0
 gGnLu2Zk0JMd7LUCHlvGQwFHOXQyo9CkkfN/B0SmIKJTlEEm/dkHXx2KDBlnaAj1cDML
 euXN+cX2fSKfb6jVBxa4uZ4sQr8bMycrC370IlUvP8+qneEoaTMY2jQAYJfinccgVpS0
 5XCYZ/UhSaE+NfEFb77LlizzaTX0CBJTYUXTvh+6svdIVMgBFjjAtjF+M2J39ZPk/+Og
 Y6ZQ==
X-Gm-Message-State: AOAM532u7GOva8YMwnJnxw2ZVuOqQWcxO7upZFy6uHEx4xHT5xMYHAJO
 EqZBwZ2AM9Jk5tw55Cx1Q70weg==
X-Google-Smtp-Source: ABdhPJxGaNSW+DRibwRVmL/Ce9KhEbw1nhmcpRfE50Q1Cd2e/1jKGjTJrcS4y3HuGEpxpWiaHrJQNA==
X-Received: by 2002:a05:6512:a86:: with SMTP id
 m6mr6082424lfu.149.1634652794616; 
 Tue, 19 Oct 2021 07:13:14 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id d24sm1957805ljc.2.2021.10.19.07.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:13:14 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: dinguyen@kernel.org, robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@semihalf.com,
 mw@semihalf.com, jam@semihalf.com, ka@semihalf.com, tn@semihalf.com,
 amstan@google.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v4 2/2] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Tue, 19 Oct 2021 16:12:28 +0200
Message-ID: <20211019141228.1271617-3-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019141228.1271617-1-pan@semihalf.com>
References: <20211019141228.1271617-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_071320_657521_7AE83D2D 
X-CRM114-Status: GOOD (  16.63  )
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
Message-ID: <20211019141228.y5ZsWyc4qYFRFkCkR9DU2uAHp_BBOXuR_G2w-sk-qMo@z>

QWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBBcnJpYSAxMCBTb0Mg
RlBHQS4KClNpZ25lZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJvemVrQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFyaXVzeiBHbGVib2NraSA8bWdsZWJvY2tpQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogVG9tYXN6IEdvcm9jaG93aWsgPHRnb3JvY2hvd2lrQGFudG1pY3JvLmNvbT4KU2ln
bmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEgPG1taWt1bmRhQGFudG1pY3JvLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4u
L2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMgIHwgMTA1ICsrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5k
dHMKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL01ha2VmaWxlCmluZGV4IDdlMDkzNDE4MDcyNC4uODAzNzAyODgzMTIyIDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9N
YWtlZmlsZQpAQCAtMTA3NSw2ICsxMDc1LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfUzVQVjIxMCkg
Kz0gXAogCXM1cHYyMTAtdG9yYnJlY2suZHRiCiBkdGItJChDT05GSUdfQVJDSF9JTlRFTF9TT0NG
UEdBKSArPSBcCiAJc29jZnBnYV9hcnJpYTVfc29jZGsuZHRiIFwKKwlzb2NmcGdhX2FycmlhMTBf
bWVyY3VyeV9hYTEuZHRiIFwKIAlzb2NmcGdhX2FycmlhMTBfc29jZGtfbmFuZC5kdGIgXAogCXNv
Y2ZwZ2FfYXJyaWExMF9zb2Nka19xc3BpLmR0YiBcCiAJc29jZnBnYV9hcnJpYTEwX3NvY2RrX3Nk
bW1jLmR0YiBcCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBf
bWVyY3VyeV9hYTEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc29jZnBnYV9hcnJpYTEwX21lcmN1
cnlfYWExLmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmQ3N2Qw
YzNkNzFiOQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJy
aWExMF9tZXJjdXJ5X2FhMS5kdHMKQEAgLTAsMCArMSwxMDUgQEAKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCisvZHRzLXYxLzsKKworI2luY2x1ZGUgInNvY2ZwZ2FfYXJyaWEx
MC5kdHNpIgorCisvIHsKKworCW1vZGVsID0gIkVuY2x1c3RyYSBNZXJjdXJ5IEFBMSI7CisJY29t
cGF0aWJsZSA9ICJhbHRyLHNvY2ZwZ2EtYXJyaWExMCIsICJhbHRyLHNvY2ZwZ2EiOworCisJbWVt
b3J5QDAgeworCQluYW1lID0gIm1lbW9yeSI7CisJCWRldmljZV90eXBlID0gIm1lbW9yeSI7CisJ
CXJlZyA9IDwweDAgMHg4MDAwMDAwMD47IC8qIDJHQiAqLworCX07CisKKwljaG9zZW4geworCQlz
dGRvdXQtcGF0aCA9ICJzZXJpYWwxOjExNTIwMG44IjsKKwl9OworfTsKKworJmVjY21nciB7CisJ
c2RtbWNhLWVjY0BmZjhjMmMwMCB7CisJCWNvbXBhdGlibGUgPSAiYWx0cixzb2NmcGdhLXNkbW1j
LWVjYyI7CisJCXJlZyA9IDwweGZmOGMyYzAwIDB4NDAwPjsKKwkJYWx0cixlY2MtcGFyZW50ID0g
PCZtbWM+OworCQlpbnRlcnJ1cHRzID0gPDE1IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAg
ICA8NDcgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAgIDwxNiBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwKKwkJCSAgICAgPDQ4IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCX07Cit9OworCismZ21h
YzAgeworCXBoeS1tb2RlID0gInJnbWlpIjsKKwlwaHktYWRkciA9IDwweGZmZmZmZmZmPjsgLyog
cHJvYmUgZm9yIHBoeSBhZGRyICovCisKKwltYXgtZnJhbWUtc2l6ZSA9IDwzODAwPjsKKwlzdGF0
dXMgPSAib2theSI7CisKKwlwaHktaGFuZGxlID0gPCZwaHkzPjsKKworCW1kaW8geworCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAi
c25wcyxkd21hYy1tZGlvIjsKKwkJcGh5MzogZXRoZXJuZXQtcGh5QDMgeworCQkJdHhkMC1za2V3
LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXR4ZDEtc2tldy1wcyA9IDwwPjsgLyogLTQyMHBz
ICovCisJCQl0eGQyLXNrZXctcHMgPSA8MD47IC8qIC00MjBwcyAqLworCQkJdHhkMy1za2V3LXBz
ID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXJ4ZDAtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8K
KwkJCXJ4ZDEtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8KKwkJCXJ4ZDItc2tldy1wcyA9IDw0
MjA+OyAvKiAwcHMgKi8KKwkJCXJ4ZDMtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8KKwkJCXR4
ZW4tc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICovCisJCQl0eGMtc2tldy1wcyA9IDwxODYwPjsg
LyogOTYwcHMgKi8KKwkJCXJ4ZHYtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8KKwkJCXJ4Yy1z
a2V3LXBzID0gPDE2ODA+OyAvKiA3ODBwcyAqLworCQkJcmVnID0gPDM+OworCQl9OworCX07Cit9
OworCismZ3BpbzAgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZncGlvMSB7CisJc3RhdHVz
ID0gIm9rYXkiOworfTsKKworJmdwaW8yIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismaTJj
MSB7CisJc3RhdHVzID0gIm9rYXkiOworCWlzbDEyMDIyOiBpc2wxMjAyMkA2ZiB7CisJCXN0YXR1
cyA9ICJva2F5IjsKKwkJY29tcGF0aWJsZSA9ICJpc2lsLGlzbDEyMDIyIjsKKwkJcmVnID0gPDB4
NmY+OworCX07Cit9OworCisvKiBGb2xsb3dpbmcgbWFwcGluZ3MgYXJlIHRha2VuIGZyb20gYXJy
aWExMCBzb2NkayBkdHMgKi8KKyZtbWMgeworCXN0YXR1cyA9ICJva2F5IjsKKwljYXAtc2QtaGln
aHNwZWVkOworCWJyb2tlbi1jZDsKKwlidXMtd2lkdGggPSA8ND47Cit9OworCismb3NjMSB7CisJ
Y2xvY2stZnJlcXVlbmN5ID0gPDMzMzMwMDAwPjsKK307CisKKyZ1YXJ0MSB7CisJc3RhdHVzID0g
Im9rYXkiOworfTsKKworJnVzYjAgeworCXN0YXR1cyA9ICJva2F5IjsKKwlkcl9tb2RlID0gImhv
c3QiOworfTsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
