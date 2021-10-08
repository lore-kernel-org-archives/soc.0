Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1948BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1F561029
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA1F561029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9WUdNGq5x74rkI8mC5RlcFTQMCijSUMU/8AHcwsazU=; b=EMeaAZSQG0lzq3
	l8qapos1uIPYTkBaLFMmI/fWqsg3IkL3Hw2eIbDzgj/0oiO0C4Xapvm2+oAvuwskzStS0ct+g5lxW
	Ni/Jqx4LKdQWr53y0t48fp6sLYedDFgSojKQDL8gZdOudLY5ZCpDf+AGClmooGRB5sZWOIqs0jawt
	haSPL2QtPAyHRDfK9Gtu9fRQiChVFRiLKzfJp5u4AU63PbNFxA+OcWDR9VbomJza5NVTQ53m8eBRA
	2LLk56MLh6EdbGe4AvyIT17zeuNI2EJsnG/eJhczos+ynk+wsHx/4EnmttOcPl3omkr5+uPyqywgg
	2XsAKbwFx/5LcxLYePuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqXp-0031bV-8P; Fri, 08 Oct 2021 14:08:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqXd-0031XS-Ro
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 14:08:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id r19so37927082lfe.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gttg+v6XbDIarAgQi1Ce3aR1kSoKgCW6Taf8X2Jr5ZQ=;
 b=OiYiJt/fIyBMC+P3XVgVgk8OtW58yDWtJSv++nyw1MeV8Zo+hmC4r4oUEsAcgEnch3
 FeuJuDRMIDhzRtCOi5h9yjht5K/Yy6xQLNwUnAv+1mNlc6x92Y7DmzbQ3HUpTVqZLAka
 GfzSLcKBhO02V5mlrdzJ7eruTtwGySzqMmtT1/k2cx2rReLZ2HAN8R+AmJlBPOt9j5vt
 Vo/p8kI70JT/jiP2qiy/NvT+6kbGCZ2uJ1qPmYdaY4j6ALxV1LxQFylPzS02n+vpLP5L
 p4CxcKEPJkWrs6HpuoCO0gvZWY2Dmti/PAPwuSt8BCMMBn6zOciVNZvyJFbj9aohl2/m
 IJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gttg+v6XbDIarAgQi1Ce3aR1kSoKgCW6Taf8X2Jr5ZQ=;
 b=WM5s5L6dAgXWnn13oohdSGCbZUQwexFM9cgGtKAB0/l92fuAVQjLXPhkpXQfaX+6eZ
 vBP/TtpTj3ajW5HYlbbZ23YbdevAbxHB0bFHC4jelw+4IFrOPuFEeqn5viJ7tFt4Y1kq
 VIGsB1MXUkGNsvO04R9R0h/ph0GyIkkTHO/gDVvngoYkY9BdtcIJf7LWDgb0DxtdXkr9
 Xq+E8QQ3oMyPc3Qg0Az7mgBBr38Z3nxHxbePiYCMwWl9O6qa9qaF7f5pz1KhfVdizAc5
 u7TkXamxxw+O7dNoDxij0JCYYWFAKVbR0QYrx++r51mbDETEvdycPbymlq+3Mgrg9zGj
 6KwA==
X-Gm-Message-State: AOAM531b8LSYoPWujxiDxdxgcRGRvDZWLV/UVnp1wYcVuWST21ClqfQ+
 nE5eexyCbw1SxvXTR6gwtnImNQ==
X-Google-Smtp-Source: ABdhPJx6Y0vAbnM8Fk95LZoJHxmArUZdZbwbvSH8XCOCNhaj/aRtIkpg+t5fPkZH5HwF8oaz0wq38Q==
X-Received: by 2002:a05:651c:997:: with SMTP id
 b23mr3885319ljq.325.1633702081587; 
 Fri, 08 Oct 2021 07:08:01 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id j23sm252667lfm.139.2021.10.08.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:08:01 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@semihalf.com, mw@semihalf.com,
 ka@semihalf.com, tn@semihalf.com, jam@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v3 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Fri,  8 Oct 2021 16:07:35 +0200
Message-ID: <20211008140735.3290892-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008140735.3290892-1-pan@semihalf.com>
References: <20211008140735.3290892-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_070805_934441_04D280A0 
X-CRM114-Status: GOOD (  16.12  )
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
Message-ID: <20211008140735.Ror5rDa4vZ1CHKWhMuNv14LSYOSWONhOt3Hrf_vj238@z>

QWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBBcnJpYSAxMCBTb0Mg
RlBHQS4KClNpZ25lZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJvemVrQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFyaXVzeiBHbGVib2NraSA8bWdsZWJvY2tpQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogVG9tYXN6IEdvcm9jaG93aWsgPHRnb3JvY2hvd2lrQGFudG1pY3JvLmNvbT4KU2ln
bmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEgPG1taWt1bmRhQGFudG1pY3JvLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4u
L2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMgIHwgMTEyICsrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
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
MDAwMDAwMDAuLjJhMzM2NGIyNjM2MQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMKQEAgLTAsMCArMSwxMTIgQEAKKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvZHRzLXYxLzsKKworI2luY2x1ZGUg
InNvY2ZwZ2FfYXJyaWExMC5kdHNpIgorCisvIHsKKworCW1vZGVsID0gIkVuY2x1c3RyYSBNZXJj
dXJ5IEFBMSI7CisJY29tcGF0aWJsZSA9ICJhbHRyLHNvY2ZwZ2EtYXJyaWExMCIsICJhbHRyLHNv
Y2ZwZ2EiOworCisJYWxpYXNlcyB7CisJCWV0aGVybmV0MCA9ICZnbWFjMDsKKwkJc2VyaWFsMSA9
ICZ1YXJ0MTsKKwkJaTJjMCA9ICZpMmMwOworCQlpMmMxID0gJmkyYzE7CisJfTsKKworCW1lbW9y
eUAwIHsKKwkJbmFtZSA9ICJtZW1vcnkiOworCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOworCQly
ZWcgPSA8MHgwIDB4ODAwMDAwMDA+OyAvKiAyR0IgKi8KKwl9OworCisJY2hvc2VuIHsKKwkJc3Rk
b3V0LXBhdGggPSAic2VyaWFsMToxMTUyMDBuOCI7CisJfTsKK307CisKKyZlY2NtZ3IgeworCXNk
bW1jYS1lY2NAZmY4YzJjMDAgeworCQljb21wYXRpYmxlID0gImFsdHIsc29jZnBnYS1zZG1tYy1l
Y2MiOworCQlyZWcgPSA8MHhmZjhjMmMwMCAweDQwMD47CisJCWFsdHIsZWNjLXBhcmVudCA9IDwm
bW1jPjsKKwkJaW50ZXJydXB0cyA9IDwxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAgICAg
PDQ3IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8MTYgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkgICAgIDw0OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwl9OworfTsKKworJmdtYWMw
IHsKKwlwaHktbW9kZSA9ICJyZ21paSI7CisJcGh5LWFkZHIgPSA8MHhmZmZmZmZmZj47IC8qIHBy
b2JlIGZvciBwaHkgYWRkciAqLworCisJbWF4LWZyYW1lLXNpemUgPSA8MzgwMD47CisJc3RhdHVz
ID0gIm9rYXkiOworCisJcGh5LWhhbmRsZSA9IDwmcGh5Mz47CisKKwltZGlvIHsKKwkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCQljb21wYXRpYmxlID0gInNu
cHMsZHdtYWMtbWRpbyI7CisJCXBoeTM6IGV0aGVybmV0LXBoeUAzIHsKKwkJCXR4ZDAtc2tldy1w
cyA9IDwwPjsgLyogLTQyMHBzICovCisJCQl0eGQxLXNrZXctcHMgPSA8MD47IC8qIC00MjBwcyAq
LworCQkJdHhkMi1za2V3LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXR4ZDMtc2tldy1wcyA9
IDwwPjsgLyogLTQyMHBzICovCisJCQlyeGQwLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJ
CQlyeGQxLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQlyeGQyLXNrZXctcHMgPSA8NDIw
PjsgLyogMHBzICovCisJCQlyeGQzLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQl0eGVu
LXNrZXctcHMgPSA8MD47IC8qIC00MjBwcyAqLworCQkJdHhjLXNrZXctcHMgPSA8MTg2MD47IC8q
IDk2MHBzICovCisJCQlyeGR2LXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQlyeGMtc2tl
dy1wcyA9IDwxNjgwPjsgLyogNzgwcHMgKi8KKwkJCXJlZyA9IDwzPjsKKwkJfTsKKwl9OworfTsK
KworJmdwaW8wIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismZ3BpbzEgeworCXN0YXR1cyA9
ICJva2F5IjsKK307CisKKyZncGlvMiB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmkyYzEg
eworCXN0YXR1cyA9ICJva2F5IjsKKwlpc2wxMjAyMjogaXNsMTIwMjJANmYgeworCQlzdGF0dXMg
PSAib2theSI7CisJCWNvbXBhdGlibGUgPSAiaXNpbCxpc2wxMjAyMiI7CisJCXJlZyA9IDwweDZm
PjsKKwl9OworfTsKKworLyogRm9sbG93aW5nIG1hcHBpbmdzIGFyZSB0YWtlbiBmcm9tIGFycmlh
MTAgc29jZGsgZHRzICovCismbW1jIHsKKwlzdGF0dXMgPSAib2theSI7CisJY2FwLXNkLWhpZ2hz
cGVlZDsKKwlicm9rZW4tY2Q7CisJYnVzLXdpZHRoID0gPDQ+OworfTsKKworJm9zYzEgeworCWNs
b2NrLWZyZXF1ZW5jeSA9IDwzMzMzMDAwMD47Cit9OworCismdWFydDEgeworCXN0YXR1cyA9ICJv
a2F5IjsKK307CisKKyZ1c2IwIHsKKwlzdGF0dXMgPSAib2theSI7CisJZHJfbW9kZSA9ICJob3N0
IjsKK307Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
