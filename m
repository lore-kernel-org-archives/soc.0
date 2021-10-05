Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609D0C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E20B61381
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E20B61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsbJHSBSKv7ihkvpw8rPx6f4QOs/xQ8pVjQ958r9avg=; b=I8pPtfpuTJ0aPy
	eU2znaQiqpsB/qICTHV84S0cHRva7lfyFWzVrN6eCc/bL/+ZFYPZlX+dvnaBNDl3LIutCFPCufO+8
	CVubQU5GnpvzDtzGl9Ol8kefP8iev5584u2rrkSUIPCCPOt1QF/wMlqPkRCxBtvvEbtw1XAxztgMz
	Ms1bFOXsr6PZguISaqo7+1AzoFEEqDSQWeZOxiWkj4vdEI1Nd5uQ4rfyDKVeTjeeihbrl7BGmWUE6
	7V3SojwlL/ZK1vvf6h1shIE8QmFym40MoTaz667oNYaKOOPJYdWbWq6G8tRelHHAk0V/WLx10lEkI
	GMH7leSznp5Sp/RSaFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlar-00AsWD-Fu; Tue, 05 Oct 2021 14:38:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlaP-00AsPu-I0
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 14:38:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id x27so86533723lfa.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bft5UO0IvHnnqu7NpeleauDM+2TITH2jaKZbwnmA6VM=;
 b=UU9L+06t7QQJbnIFm6uKYIL3+oggbtuy1cE6fNaxN5loz+ex+Wx1xNM0Y61247WKKq
 t5Z+Q7lDLXzCH4RFCU2qjmOSqghXPGLyiEfq5cFrAcCd2Dtp3giGhL0aYbaeH2ZbQkh+
 pBVgWY2c7yWewZ76+sPWg3r5Y47Ll/aR1h+PRecw3yYibWciEUrsXmyfEVCUYQstqFXb
 EOl9cEQZteQwpvPuEVEp/opTKIeazXBV6PD+n7k07E2+5qnKaiOcjXlEXlNC+6iKasjO
 XhSPAZOpi9xso7qEzN/vIQsecPJrYLN2XLDfNyWcZ/zig5mNwz5Rj5YGIAoj/pVNSsN7
 wuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bft5UO0IvHnnqu7NpeleauDM+2TITH2jaKZbwnmA6VM=;
 b=Ek7wYGyWKI1Zh/psn6iGv8IRM4oTUHl7FjREnqBKlfP9zEy3WMX0PlXqLAxIKebIsX
 cReL6eFNEBhh6SfPFPviYtbUj7lEHlruLCeoMT4U2qrZnYtUKp9KuQYhRtjU+MQfFtdO
 ja9eEgxNTJjLFqWYBI+keSJo3BrVWNRgI4k6+JKmV6afHs/wNupJ8Vj3AmfpXXssfcHv
 XTjpW4RnHa7OM/sP3QUmBWImn1eAtfUrPwkZWOa8B8kpfBT4vcPyVdXnRvlwKJUTjA5h
 rOwl65etYXVqtR7P340vDg9a7KLGuzr4cCfm5ilhP2nDXR5uL7LqLipj/xtaBSTRTWJo
 qstA==
X-Gm-Message-State: AOAM530taCMpMjgza94EURyxb0nkMggdc0zQlYsRG1rSvqYp5iSSdUOj
 EMg/3pFozNxFKCBB/F4JLI+33g==
X-Google-Smtp-Source: ABdhPJxtNs3DBnnLdW1v/+5GPBOiTJoGXMzrfQcqBWcrRZZgflaIbwl8qX/DwjWUYD8Pej361yO4XA==
X-Received: by 2002:a05:6512:21c:: with SMTP id
 a28mr3890008lfo.626.1633444701917; 
 Tue, 05 Oct 2021 07:38:21 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:38:21 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, robh+dt@kernel.org,
 p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.yadav@ti.com, Tudor.Ambarus@microchip.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com, sre@kernel.org, thunder.leizhen@huawei.com,
 Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ka@semihalf.com, tn@semihalf.com,
 jam@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v2 4/4] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Tue,  5 Oct 2021 16:37:48 +0200
Message-ID: <20211005143748.2471647-5-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_073829_619291_A4FE0452 
X-CRM114-Status: GOOD (  16.14  )
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
Message-ID: <20211005143748.I4_BMbwCzbJqDZM7MjSm0kkCQvrzHpNje3IF2f1tyyo@z>

QWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBBcnJpYSAxMCBTb0Mg
RlBHQS4KClNpZ25lZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJvemVrQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFyaXVzeiBHbGVib2NraSA8bWdsZWJvY2tpQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogVG9tYXN6IEdvcm9jaG93aWsgPHRnb3JvY2hvd2lrQGFudG1pY3JvLmNvbT4KU2ln
bmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEgPG1taWt1bmRhQGFudG1pY3JvLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4u
L2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMgIHwgMTExICsrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5k
dHMKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL01ha2VmaWxlCmluZGV4IDdlMDkzNDE4MDcyNC4uMGE3ODA5ZWIzNzk1IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9N
YWtlZmlsZQpAQCAtMTA3OCw2ICsxMDc4LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfSU5URUxfU09D
RlBHQSkgKz0gXAogCXNvY2ZwZ2FfYXJyaWExMF9zb2Nka19uYW5kLmR0YiBcCiAJc29jZnBnYV9h
cnJpYTEwX3NvY2RrX3FzcGkuZHRiIFwKIAlzb2NmcGdhX2FycmlhMTBfc29jZGtfc2RtbWMuZHRi
IFwKKwlzb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRiIFwKIAlzb2NmcGdhX2N5Y2xvbmU1
X2NoYW1lbGVvbjk2LmR0YiBcCiAJc29jZnBnYV9jeWNsb25lNV9tY3ZldmsuZHRiIFwKIAlzb2Nm
cGdhX2N5Y2xvbmU1X3NvY2RrLmR0YiBcCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
b2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc29jZnBn
YV9hcnJpYTEwX21lcmN1cnlfYWExLmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjFlMTExNjhiODBkYgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMKQEAgLTAsMCArMSwxMTEgQEAKKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvZHRzLXYxLzsKKworI2luY2x1ZGUg
InNvY2ZwZ2FfYXJyaWExMC5kdHNpIgorCisvIHsKKworCW1vZGVsID0gIkVuY2x1c3RyYSBNZXJj
dXJ5IEFBMSI7CisJY29tcGF0aWJsZSA9ICJhbHRyLHNvY2ZwZ2EtYXJyaWExMCIsICJhbHRyLHNv
Y2ZwZ2EiOworCisJYWxpYXNlcyB7CisJCWV0aGVybmV0MCA9ICZnbWFjMDsKKwkJc2VyaWFsMSA9
ICZ1YXJ0MTsKKwl9OworCisJbWVtb3J5QDAgeworCQluYW1lID0gIm1lbW9yeSI7CisJCWRldmlj
ZV90eXBlID0gIm1lbW9yeSI7CisJCXJlZyA9IDwweDAgMHg4MDAwMDAwMD47IC8qIDJHQiAqLwor
CX07CisKKwljaG9zZW4geworCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwxOjExNTIwMG44IjsKKwl9
OworfTsKKworJmVjY21nciB7CisJc2RtbWNhLWVjY0BmZjhjMmMwMCB7CisJCWNvbXBhdGlibGUg
PSAiYWx0cixzb2NmcGdhLXNkbW1jLWVjYyI7CisJCXJlZyA9IDwweGZmOGMyYzAwIDB4NDAwPjsK
KwkJYWx0cixlY2MtcGFyZW50ID0gPCZtbWM+OworCQlpbnRlcnJ1cHRzID0gPDE1IElSUV9UWVBF
X0xFVkVMX0hJR0g+LAorCQkJICAgICA8NDcgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAg
IDwxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAgICAgPDQ4IElSUV9UWVBFX0xFVkVMX0hJ
R0g+OworCX07Cit9OworCismZ21hYzAgeworCXBoeS1tb2RlID0gInJnbWlpIjsKKwlwaHktYWRk
ciA9IDwweGZmZmZmZmZmPjsgLyogcHJvYmUgZm9yIHBoeSBhZGRyICovCisKKwltYXgtZnJhbWUt
c2l6ZSA9IDwzODAwPjsKKwlzdGF0dXMgPSAib2theSI7CisKKwlwaHktaGFuZGxlID0gPCZwaHkz
PjsKKworCW1kaW8geworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8
MD47CisJCWNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsKKwkJcGh5MzogZXRoZXJuZXQt
cGh5QDMgeworCQkJdHhkMC1za2V3LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXR4ZDEtc2tl
dy1wcyA9IDwwPjsgLyogLTQyMHBzICovCisJCQl0eGQyLXNrZXctcHMgPSA8MD47IC8qIC00MjBw
cyAqLworCQkJdHhkMy1za2V3LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXJ4ZDAtc2tldy1w
cyA9IDw0MjA+OyAvKiAwcHMgKi8KKwkJCXJ4ZDEtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8K
KwkJCXJ4ZDItc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMgKi8KKwkJCXJ4ZDMtc2tldy1wcyA9IDw0
MjA+OyAvKiAwcHMgKi8KKwkJCXR4ZW4tc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICovCisJCQl0
eGMtc2tldy1wcyA9IDwxODYwPjsgLyogOTYwcHMgKi8KKwkJCXJ4ZHYtc2tldy1wcyA9IDw0MjA+
OyAvKiAwcHMgKi8KKwkJCXJ4Yy1za2V3LXBzID0gPDE2ODA+OyAvKiA3ODBwcyAqLworCQkJcmVn
ID0gPDM+OworCQl9OworCX07Cit9OworCismZ3BpbzAgeworCXN0YXR1cyA9ICJva2F5IjsKK307
CisKKyZncGlvMSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmdwaW8yIHsKKwlzdGF0dXMg
PSAib2theSI7Cit9OworCismaTJjMSB7CisJc3RhdHVzID0gIm9rYXkiOworCWJ1c25vID0gPDE+
OworCWlzbDEyMDIyOiBpc2wxMjAyMkA2ZiB7CisJCXN0YXR1cyA9ICJva2F5IjsKKwkJY29tcGF0
aWJsZSA9ICJpc2lsLGlzbDEyMDIyIjsKKwkJcmVnID0gPDB4NmY+OworCX07Cit9OworCisvKiBG
b2xsb3dpbmcgbWFwcGluZ3MgYXJlIHRha2VuIGZyb20gYXJyaWExMCBzb2NkayBkdHMgKi8KKyZt
bWMgeworCXN0YXR1cyA9ICJva2F5IjsKKwljYXAtc2QtaGlnaHNwZWVkOworCWJyb2tlbi1jZDsK
KwlidXMtd2lkdGggPSA8ND47Cit9OworCismb3NjMSB7CisJY2xvY2stZnJlcXVlbmN5ID0gPDMz
MzMwMDAwPjsKK307CisKKyZ1YXJ0MSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJnVzYjAg
eworCXN0YXR1cyA9ICJva2F5IjsKKwlkcl9tb2RlID0gImhvc3QiOworfTsKLS0gCjIuMjUuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
